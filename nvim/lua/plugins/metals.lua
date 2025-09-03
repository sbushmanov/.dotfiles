return {
	"scalameta/nvim-metals",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"saghen/blink.cmp",
		"nvimdev/lspsaga.nvim",
		"mfussenegger/nvim-dap",
	},
	ft = { "scala", "sbt", "java", "sc" },
	config = function()
		vim.opt_global.shortmess:remove("F")
		vim.opt_global.shortmess:append("c")

		local metals = require("metals")
		local metals_config = metals.bare_config()

		metals_config.settings = {
			-- showImplicitArguments = true,
			-- showInferredType = true,
			-- superMethodLensesEnabled = true,
			-- showImplicitConversionsAndClasses = true,
			inlayHints = {
				hintsInPatternMatch = { enable = true },
				implicitArguments = { enable = true },
				implicitConversions = { enable = true },
				inferredTypes = { enable = true },
				typeParameters = { enable = true },
			},
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

		-- In metals.lua, add to the on_attach function:
		metals_config.on_attach = function(client, bufnr)
			-- Existing inlay hints code
			vim.lsp.inlay_hint.enable(true)
			vim.defer_fn(function()
				if vim.lsp.inlay_hint and client.supports_method("textDocument/inlayHint") then
					vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
				end
			end, 10000)

			-- ADD THIS DAP SETUP CODE:
			-- Setup DAP for Scala when metals attaches
			local dap_ok, dap = pcall(require, "dap")
			if dap_ok then
				-- Scala configurations via Metals
				metals.setup_dap()
				dap.configurations.scala = {
					{
						type = "scala",
						request = "launch",
						name = "RunOrDebug",
						metals = {
							runType = "runOrTestFile",
						},
					},
					{
						type = "scala",
						request = "launch",
						name = "TestTarget",
						metals = {
							runType = "testTarget",
						},
					},
				}

				-- Run code function
				local function run_scala()
					local config = dap.configurations.scala[1]
					if config then
						dap.run(config)
						dap.repl.open({}, "vsplit new")
					else
						vim.notify("No Scala debug configuration found", vim.log.levels.ERROR)
					end
				end

				-- Debug code function
				local function debug_scala()
					local config = dap.configurations.scala[1]
					if config then
						dap.run(config)
						local dap_view_ok, dap_view = pcall(require, "dap-view")
						if dap_view_ok then
							dap_view.open()
						end
					else
						vim.notify("No Scala debug configuration found", vim.log.levels.ERROR)
					end
				end

				-- Scala-specific key mappings (buffer-local)
				local opts = { buffer = bufnr, desc = "" }
				vim.keymap.set(
					"n",
					"<F1>",
					run_scala,
					vim.tbl_extend("force", opts, { desc = "Run Scala application" })
				)
				vim.keymap.set(
					"n",
					"<F3>",
					debug_scala,
					vim.tbl_extend("force", opts, { desc = "Start Scala debug session" })
				)
			end
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
		-- vim.api.nvim_create_autocmd("VimEnter", {
		-- 	callback = function()
		-- 		-- force Metals to start immediately
		-- 		require("metals").initialize_or_attach(metals_config)
		-- 	end,
		-- })
	end,
}
