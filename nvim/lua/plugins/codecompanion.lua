return {
	"olimorris/codecompanion.nvim",
	lazy = true,
	event = "VeryLazy",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
	},
	opts = {
		-- NOTE: The log_level is in `opts.opts`
		opts = {
			log_level = "DEBUG", -- or "TRACE"
		},
	},
}
