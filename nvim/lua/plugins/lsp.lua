return {
	{
		"neovim/nvim-lspconfig",
		ft = { "python", "go", "lua", "bash", "json", "yaml", "rust", "awk" },
		cmd = { "LspInfo", "LspInstall", "LspStart" },
		dependencies = {
			-- Automatically install LSPs and related tools to stdpath for Neovim
			-- Mason must be loaded before its dependents so we need to set it up here.
			-- NOTE: `opts = {}` is the same as calling `require('mason').setup({})`
			{ "mason-org/mason.nvim", opts = {} },
			{ "mason-org/mason-lspconfig.nvim" },
			{ "jay-babu/mason-nvim-dap.nvim" },
			{ "mfussenegger/nvim-dap" },
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "nvimdev/lspsaga.nvim" },
			{ "WhoIsSethDaniel/mason-tool-installer.nvim" }, -- added mason-tool-installer
		},
		config = function()
			-- This function resolves a difference between neovim nightly (version 0.11) and stable (version 0.10)
			---@param client vim.lsp.Client
			---@param method vim.lsp.protocol.Method
			---@param bufnr? integer some lsp support methods only in specific files
			---@return boolean
			local function client_supports_method(client, method, bufnr)
				if vim.fn.has("nvim-0.11") == 1 then
					return client:supports_method(method, bufnr)
				else
					return client.supports_method(method, { bufnr = bufnr })
				end
			end
			event = { "VimEnter" }
			-- Diagnostic signs & config (early, before any LSP)
			-- Diagnostic signs
			vim.diagnostic.config({
				severity_sort = true,
				float = { border = "rounded", source = "if_many" },
				underline = { severity = vim.diagnostic.severity.ERROR },
				signs = {
					text = {
						[vim.diagnostic.severity.ERROR] = " ",
						[vim.diagnostic.severity.WARN] = " ",
						[vim.diagnostic.severity.INFO] = " ",
						[vim.diagnostic.severity.HINT] = "󰠠 ",
					},
				},
				virtual_text = {
					source = "if_many",
					spacing = 2,
					format = function(diagnostic)
						local diagnostic_message = {
							[vim.diagnostic.severity.ERROR] = diagnostic.message,
							[vim.diagnostic.severity.WARN] = diagnostic.message,
							[vim.diagnostic.severity.INFO] = diagnostic.message,
							[vim.diagnostic.severity.HINT] = diagnostic.message,
						}
						return diagnostic_message[diagnostic.severity]
					end,
				},
			})

			-- Capabilities for LSP completion & folding
			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())
			-- Mason setups
			require("mason").setup()
			require("mason-nvim-dap").setup({
				ensure_installed = { "debugpy" },
				automatic_installation = true,
			})

			require("mason-tool-installer").setup({
				ensure_installed = {
					"stylua", -- example formatter
					-- add other tools here as needed
				},
				auto_update = true,
			})

			-- Update hover and signatureHelp handlers (non-deprecated)
			vim.lsp.handlers["textDocument/hover"] = function(err, result, ctx, config)
				config = config or {}
				config.border = "rounded"
				if not (result and result.contents) then
					return
				end
				vim.lsp.util.open_floating_preview(
					vim.lsp.util.convert_input_to_markdown_lines(result.contents),
					"markdown",
					config
				)
			end

			vim.lsp.handlers["textDocument/signatureHelp"] = function(err, result, ctx, config)
				config = config or {}
				config.border = "rounded"
				if not (result and result.signatures and result.signatures[1]) then
					return
				end
				vim.lsp.util.open_floating_preview(
					vim.lsp.util.signature_help_to_markdown_lines(result),
					"markdown",
					config
				)
			end

			-- LspAttach autocmd for keymaps and inlay hints
			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("UserLspConfig", { clear = true }),
				callback = function(event)
					local bufnr = event.buf
					local client = vim.lsp.get_client_by_id(event.data.client_id)

					-- Buffer local mappings
					local map = function(keys, func, desc, mode)
						mode = mode or "n"
						vim.keymap.set(mode, keys, func, { buffer = bufnr, desc = "LSP: " .. desc })
					end

					map("gd", vim.lsp.buf.definition, "Go to Definition")
					map("gr", vim.lsp.buf.references, "Go to References")
					map("K", vim.lsp.buf.hover, "Hover Documentation")
					map("<leader>rn", vim.lsp.buf.rename, "Rename")
					map("<leader>ca", vim.lsp.buf.code_action, "Code Action")

					-- Autoformat on save if supported
					if
						client
						and client.server_capabilities
						and client.server_capabilities.documentFormattingProvider
					then
						local group = vim.api.nvim_create_augroup("LspFormat" .. bufnr, { clear = true })
						vim.api.nvim_create_autocmd("BufWritePre", {
							group = group,
							buffer = bufnr,
							callback = function()
								vim.lsp.buf.format({ async = false })
							end,
						})
					end

					-- Enable inlay hints if supported
					if
						client
						and client_supports_method(client, vim.lsp.protocol.Methods.textDocument_inlayHint, event.buf)
					then
						map("<leader>th", function()
							vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = event.buf }))
						end, "[T]oggle Inlay [H]ints")
					end
				end,
			})

			-- Per-server configs (override defaults as needed)
			local servers = {
				jsonls = {},
				yamlls = {},
				gopls = {},
				typos_lsp = {},
				jedi_language_server = {},
				rust_analyzer = {},
				ruff = {
					init_options = { settings = { args = {} } },
				},
				pyright = {
					settings = {
						python = {
							analysis = {
								autoSearchPaths = true,
								diagnosticMode = "openFilesOnly",
								typeCheckingMode = "off",
								disableOrganizeImports = true,
								diagnosticSeverityOverrides = {
									reportConstantRedefinition = "warning",
									reportDuplicateImport = "warning",
									reportMissingSuperCall = "warning",
									reportUnnecessaryCast = "warning",
									reportUnnecessaryComparison = "warning",
									reportUnnecessaryContains = "warning",
									reportCallInDefaultInitializer = "info",
									reportFunctionMemberAccess = "info",
									reportImportCycles = "info",
									reportMatchNotExhaustive = "info",
									reportShadowedImports = "info",
									reportUninitializedInstanceVariable = "info",
									reportUnnecessaryIsInstance = "info",
									reportUnusedClass = "info",
									reportUnusedFunction = "info",
									reportUnusedImport = "info",
									reportUnusedVariable = "info",
								},
							},
						},
					},
				},
				lua_ls = {
					settings = {
						Lua = {
							runtime = { version = "LuaJIT" },
							diagnostics = {
								globals = { "vim", "require" },
								disable = { "missing-parameters", "missing-fields", "lowercase-global" },
							},
							workspace = {
								library = {
									vim.api.nvim_get_runtime_file("", true),
									"${3rd}/luv/library",
								},
							},
							telemetry = { enable = false },
						},
					},
				},
			}

			-- Mason-lspconfig handler-based setup

			require("mason-lspconfig").setup({
				ensure_installed = {
					"pyright",
					"bashls",
					"lua_ls",
					"gopls",
					"jsonls",
					"awk_ls",
					"yamlls",
					"ruff",
					"rust_analyzer",
					"typos_lsp",
				},
				automatic_installation = true,
				handlers = {
					function(server_name)
						local server = servers[server_name] or {}
						-- This handles overriding only values explicitly passed
						-- by the server configuration above. Useful when disabling
						-- certain features of an LSP (for example, turning off formatting for ts_ls)
						server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
						require("lspconfig")[server_name].setup(server)
					end,
				},
			})
		end,
	},
}
