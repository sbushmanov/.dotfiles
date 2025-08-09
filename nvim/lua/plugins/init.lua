return {
	-- { "danth/pathfinder.vim",    lazy = false },

	-- { "JoosepAlviste/nvim-ts-context-commentstring", lazy = true },
	{ "nvim-lua/plenary.nvim", lazy = true }, -- defer loading plenary, load on demand
	{
		"tpope/vim-unimpaired",
		lazy = true,
		event = "VeryLazy",
	},
	{ "tpope/vim-markdown", ft = "markdown" }, -- only load on markdown files
	{ "mattn/calendar-vim", cmd = "Calendar" }, -- load on calendar command
	{ "junegunn/vim-easy-align" }, -- load only on command
	{
		"numToStr/Comment.nvim",
		keys = { "gcc", "gbc" },
		event = "VeryLazy",
	}, -- load on commenting keys
	{
		"chrisgrieser/nvim-rip-substitute",
		cmd = "RipSubstitute",
		keys = { "<leader>rs" },
	}, -- load on command or keys
	{
		"lewis6991/gitsigns.nvim",
		event = "BufReadPre",
		lazy = true,
	}, -- load on reading buffer
	{
		"WhoIsSethDaniel/toggle-lsp-diagnostics.nvim",
		cmd = "ToggleLspDiagnostics",
		lazy = true,
	},
	-- add other plugins with appropriate lazy loading here
}
