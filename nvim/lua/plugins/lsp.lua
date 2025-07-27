return {
	{
		"neovim/nvim-lspconfig",
		event = { "CursorMoved", "BufNewFile" },
		cmd = { "LspInfo", "LspInstall", "InsertEnter" },
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"jay-babu/mason-nvim-dap.nvim", -- for debug adapters
			"mfussenegger/nvim-dap",
			"hrsh7th/cmp-nvim-lsp",
			"nvimdev/lspsaga.nvim",
		},
		config = function()
			require("lazydev").setup({})

			-- Diagnostics signs
			local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
			for type, icon in pairs(signs) do
				local hl = "DiagnosticSign" .. type
				vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
			end

			-- Capabilities for completion
			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities.textDocument.completion.completionItem.snippetSupport = true
			local cmp_lsp = require("cmp_nvim_lsp")
			local cmp_capabilities = cmp_lsp.default_capabilities(capabilities)
			-- enable folding
			cmp_capabilities.textDocument.foldingRange = {
				dynamicRegistration = false,
				lineFoldingOnly = true,
			}

			-- Mason setup
			require("mason").setup()

			-- Mason-LSPConfig: ensure servers
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
			})

			-- Mason-nvim-dap: ensure debuggers
			require("mason-nvim-dap").setup({
				ensure_installed = { "debugpy" },
				automatic_installation = true,
			})

			-- Load lspconfig
			local lspconfig = require("lspconfig")

			-- Setup servers
			local default_on_attach = function(client, bufnr)
				-- you can add custom keymaps here
			end

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

			for server, opts in pairs(servers) do
				opts.on_attach = default_on_attach
				opts.capabilities = cmp_capabilities
				lspconfig[server].setup(opts)
			end
		end,
	},
}
