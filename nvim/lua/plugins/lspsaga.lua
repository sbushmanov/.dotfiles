return {
	"nvimdev/lspsaga.nvim",
	lazy = "true",
	config = function()
		require("lspsaga").setup({
			ui = {
				-- Currently, only the round theme exists
				theme = "round",
				-- This option only works in Neovim 0.9
				title = true,
				-- Border type can be single, double, rounded, solid, shadow.
				border = "rounded",
				winblend = 0,
				expand = "",
				collapse = "",
				preview = " ",
				code_action = "💡",
				diagnostic = "🐞",
				incoming = " ",
				outgoing = " ",
				hover = " ",
				kind = {},
			},
		})
	end,
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-tree/nvim-web-devicons",
		"nvim-telescope/telescope.nvim",
		"neovim/nvim-lspconfig",
	},
	enabled = true,
}
