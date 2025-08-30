return {
	-- Main LSP Configuration
	"neovim/nvim-lspconfig",
	event = "VeryLazy",
	-- ft = { "python", "go", "lua", "bash", "json", "yaml", "rust", "awk" },
	cmd = { "LspInfo", "LspInstall", "LspStart" },
	dependencies = {
		-- Automatically install LSPs and related tools to stdpath for Neovim
		{ "mason-org/mason.nvim", opts = {} },
		{ "mason-org/mason-lspconfig.nvim" },
		{ "WhoIsSethDaniel/mason-tool-installer.nvim" },
		{ "nvimdev/lspsaga.nvim" },

		-- Useful status updates for LSP.
		{ "j-hui/fidget.nvim", opts = {} },
	},
	config = function()
		--  This function gets run when an LSP attaches to a particular buffer.
		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("kickstart-lsp-attach", { clear = true }),
			callback = function(event)
				local map = function(keys, func, desc, mode)
					mode = mode or "n"
					vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
				end

				-- Jump to the definition of the word under your cursor.
				map("gd", function()
					require("snacks").picker.lsp_definitions()
				end, "[G]oto [D]efinition")

				-- Find references for the word under your cursor.
				map("gr", function()
					require("snacks").picker.lsp_references()
				end, "[G]oto [R]eferences")

				-- Jump to the implementation of the word under your cursor.
				map("gI", function()
					require("snacks").picker.lsp_implementations()
				end, "[G]oto [I]mplementation")

				-- Jump to the type of the word under your cursor.
				map("<leader>D", function()
					require("snacks").picker.lsp_type_definitions()
				end, "Type [D]efinition")

				-- Fuzzy find all the symbols in your current document.
				map("<leader>ds", function()
					require("snacks").picker.lsp_symbols()
				end, "[D]ocument [S]ymbols")

				-- Fuzzy find all the symbols in your current workspace.
				map("<leader>ws", function()
					require("snacks").picker.lsp_workspace_symbols()
				end, "[W]orkspace [S]ymbols")

				-- Rename the variable under your cursor.
				map("<leader>cr", vim.lsp.buf.rename, "[R]e[n]ame")

				-- Go to declaration
				map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")

				-- Hover documentation
				map("K", vim.lsp.buf.hover, "Hover Documentation")

				-- Signature help
				map("<C-k>", vim.lsp.buf.signature_help, "Signature Help", "i")

				-- Format buffer
				map("<leader>F", vim.lsp.buf.format, "Format Buffer")

				-- Code lens
				map("<leader>cl", vim.lsp.codelens.run, "[C]ode [L]ens")

				-- This function resolves a difference between neovim nightly and stable
				local function client_supports_method(client, method, bufnr)
					if vim.fn.has("nvim-0.11") == 1 then
						return client:supports_method(method, bufnr)
					else
						return client.supports_method(method, { bufnr = bufnr })
					end
				end

				-- Highlight references
				local client = vim.lsp.get_client_by_id(event.data.client_id)
				if
					client
					and client_supports_method(
						client,
						vim.lsp.protocol.Methods.textDocument_documentHighlight,
						event.buf
					)
				then
					local highlight_augroup = vim.api.nvim_create_augroup("kickstart-lsp-highlight", { clear = false })
					vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
						buffer = event.buf,
						group = highlight_augroup,
						callback = vim.lsp.buf.document_highlight,
					})

					vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
						buffer = event.buf,
						group = highlight_augroup,
						callback = vim.lsp.buf.clear_references,
					})

					vim.api.nvim_create_autocmd("LspDetach", {
						group = vim.api.nvim_create_augroup("kickstart-lsp-detach", { clear = true }),
						callback = function(event2)
							vim.lsp.buf.clear_references()
							vim.api.nvim_clear_autocmds({ group = "kickstart-lsp-highlight", buffer = event2.buf })
						end,
					})
				end

				-- Inlay hints toggle
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

		-- Diagnostic Config
		vim.diagnostic.config({
			severity_sort = true,
			float = { border = "rounded", source = "if_many" },
			underline = { severity = vim.diagnostic.severity.ERROR },
			signs = {
				text = {
					[vim.diagnostic.severity.ERROR] = " ",
					[vim.diagnostic.severity.WARN] = " ",
					[vim.diagnostic.severity.INFO] = " ",
					[vim.diagnostic.severity.HINT] = "󰌶 ",
				},
			},
			virtual_text = {
				source = "if_many",
				spacing = 2,
				format = function(diagnostic)
					return diagnostic.message
				end,
			},
		})

		-- LSP capabilities with blink.cmp
		local original_capabilities = vim.lsp.protocol.make_client_capabilities()
		local capabilities = require("blink.cmp").get_lsp_capabilities(original_capabilities)

		-- Enable the following language servers
		local servers = {
			pyright = {
				settings = {
					python = {
						pythonPath = "/home/sergey/anaconda3/bin/python",
						venvPath = "/home/sergey/anaconda3/envs",
						analysis = {
							autoSearchPaths = true,
							diagnosticMode = "openFilesOnly", -- only open files analyzed
							typeCheckingMode = "off", -- delegate to Ruff
							disableOrganizeImports = true, -- let Ruff handle imports
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
			bashls = {},
			marksman = {},
			lua_ls = {
				settings = {
					Lua = {
						completion = {
							callSnippet = "Replace",
						},
						runtime = {
							version = "LuaJIT",
							path = {
								"lua/?.lua",
								"lua/?/init.lua",
							},
						},
						workspace = {
							checkThirdParty = false,
							library = {
								vim.env.VIMRUNTIME,
								"${3rd}/luv/library",
							},
							preloadFileSize = 100,
							maxPreload = 2000,
						},
						telemetry = { enable = false },
						diagnostics = {
							globals = { "vim" },
						},
					},
				},
			},
		}

		-- Tools to ensure are installed
		local ensure_installed = vim.tbl_keys(servers or {})
		vim.list_extend(ensure_installed, {
			"stylua", -- Used to format Lua code
			"prettierd", -- Used to format javascript and typescript code
		})

		require("mason-tool-installer").setup({ ensure_installed = ensure_installed })

		-- Setup LSP servers
		require("mason-lspconfig").setup({
			ensure_installed = {},
			automatic_installation = false,
			handlers = {
				function(server_name)
					local server = servers[server_name] or {}
					-- Override capabilities
					server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
					require("lspconfig")[server_name].setup(server)
				end,
			},
		})
	end,
}
