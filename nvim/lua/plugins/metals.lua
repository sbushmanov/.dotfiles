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
	ft = { "scala", "sbt", "java", "sc" },
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

		-- In metals.lua, add to the on_attach function:
		metals_config.on_attach = function(client, bufnr)
			-- Delay inlay hints for Metals to ensure settings are applied
			vim.defer_fn(function()
				if vim.lsp.inlay_hint and client.supports_method("textDocument/inlayHint") then
					vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
				end
			end, 10000) -- 500ms delay
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
				require("metals").initialize_or_attach(metals_config)
			end,
		})
	end,
}
