return {
	"scalameta/nvim-metals",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"saghen/blink.cmp",
		"nvimdev/lspsaga.nvim",
		{
			"j-hui/fidget.nvim",
			opts = {},
		},
		{
			"mfussenegger/nvim-dap",
			config = function()
				local dap = require("dap")

				-- Keep your split settings
				dap.defaults.fallback.terminal_win_cmd = "vsplit new"

				-- Define configurations for Scala
				dap.configurations.scala = {
					{
						type = "scala",
						request = "launch",
						name = "RunOrTest",
						metals = {
							runType = "runOrTestFile",
						},
					},
					{
						type = "scala",
						request = "launch",
						name = "Test Target",
						metals = {
							runType = "testTarget",
						},
					},
				}

				-- Open REPL after starting debug
				dap.listeners.after.event_initialized["open_repl"] = function()
					dap.repl.open({}, "vsplit new")
				end
			end,
		},
	},
	ft = { "scala", "sbt", "java" },
	config = function()
		vim.opt_global.shortmess:remove("F")
		vim.opt_global.shortmess:append("c")

		local metals = require("metals")
		local metals_config = metals.bare_config()

		metals_config.settings = {
			showImplicitArguments = true,
			showInferredType = true,
			superMethodLensesEnabled = true,
			showImplicitConversionsAndClasses = true,
		}

		metals_config.init_options.statusBarProvider = "on"

		local capabilities = {
			textDocument = {
				foldingRange = {
					dynamicRegistration = false,
					lineFoldingOnly = true,
				},
			},
		}
		capabilities = require("blink.cmp").get_lsp_capabilities(capabilities)
		metals_config.capabilities = capabilities

		-- ✅ Set up the Scala DAP adapter early so it exists before dap.configurations runs
		metals.setup_dap()

		metals_config.on_attach = function(client, bufnr)
			-- Your LSP mappings can go here if needed
		end

		-- Autocmd to start Metals
		local nvim_metals_group = vim.api.nvim_create_augroup("nvim-metals", { clear = true })
		vim.api.nvim_create_autocmd("FileType", {
			pattern = { "scala", "sbt", "java" },
			callback = function()
				metals.initialize_or_attach(metals_config)
			end,
			group = nvim_metals_group,
		})
	end,
}
