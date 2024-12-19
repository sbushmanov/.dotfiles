return {
	{
		"williamboman/mason.nvim",
		build = ":MasonUpdate",
		config = function()
			require("mason").setup({})
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			ensure_installed =
				{ "debugpy", "pyright", "bashls", "lua_ls", "gopls", "jsonls", "awk_ls", "yamlls", "nushell" }
		end,
	},
	{
		"neovim/nvim-lspconfig",
		-- ft = { "sc", "scala", "lua", "go", "nu" },
		event = { "CursorMoved", "BufNewFile" },
		cmd = { "LspInfo", "LspInstall", "InsertEnter" },
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"nvimdev/lspsaga.nvim",
		},
		config = function()
			require("lazydev").setup({})

			local mason_lspconfig = require("mason-lspconfig")
			mason_lspconfig.setup({
				automatic_installation = true,
			})

			local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
			for type, icon in pairs(signs) do
				local hl = "DiagnosticSign" .. type
				vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
			end

			local lspconfig = require("lspconfig")

			lspconfig.jsonls.setup({})
			lspconfig.yamlls.setup({})
			lspconfig.gopls.setup({})
			lspconfig.nushell.setup({})
			lspconfig.jedi_language_server.setup({})
			lspconfig.rust_analyzer.setup({})

			lspconfig.pyright.setup({
				settings = {
					python = {
						analysis = {
							autoSearchPaths = true,
							diagnosticMode = "openFilesOnly",
							typeCheckingMode = "off", -- ruff
							disableOrganizeImports = true, -- Using Ruff
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
			})

			lspconfig.ruff.setup({
				init_options = {
					settings = {
						-- Any extra CLI arguments for `ruff` go here.
						args = {},
					},
				},
			})

			lspconfig.lua_ls.setup({
				settings = {
					Lua = {
						runtime = {
							-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
							version = "LuaJIT",
						},
						diagnostics = {
							-- Get the language server to recognize the `vim` global
							globals = { "vim", "require" },
							disable = { "missing-parameters", "missing-fields", "lowercase-global" },
						},
						workspace = {
							-- Make the server aware of Neovim runtime files
							library = {
								vim.api.nvim_get_runtime_file("", true),
								"${3rd}/luv/library",
							},
						},
						-- Do not send telemetry data containing a randomized but unique identifier
						telemetry = {
							enable = false,
						},
					},
				},
			})

			local on_attach = function(client, bufnr) end

			-- enable completion on all lsp instances
			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities.textDocument.completion.completionItem.snippetSupport = true
			local cmp_lsp = require("cmp_nvim_lsp")
			local cmp_capabilities = cmp_lsp.default_capabilities(capabilities)

			-- enable code folding
			-- needs to be on cmp_capabilities or it will get overwritten
			cmp_capabilities.textDocument.foldingRange = {
				dynamicRegistration = false,
				lineFoldingOnly = true,
			}

			local handlers = {
				-- default handler
				function(server_name)
					lspconfig[server_name].setup({
						on_attach = on_attach,
						capabilities = cmp_capabilities,
					})
				end,
			}
			mason_lspconfig.setup_handlers(handlers)
			-- enable completion on all lsp instances
		end,
	},
}
