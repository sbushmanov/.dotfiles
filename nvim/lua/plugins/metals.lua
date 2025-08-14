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
		vim.api.nvim_create_autocmd("VimEnter", {
			callback = function()
				-- force Metals to start immediately
				require("metals").initialize_or_attach(require("metals").bare_config())
			end,
		})
	end,
}
