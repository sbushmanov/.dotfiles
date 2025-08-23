return {
	-- Essential utilities and dependencies
	{ "nvim-lua/plenary.nvim", lazy = true }, -- defer loading plenary, load on demand

	-- Text editing enhancements
	-- {
	-- 	"tpope/vim-unimpaired",
	-- 	lazy = true,
	-- 	event = "VeryLazy",
	-- },
	{
		"junegunn/vim-easy-align",
		cmd = "EasyAlign",
		keys = { { "<leader>ea", ":EasyAlign<CR>", mode = "v", desc = "Easy Align" } },
	},
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = true,
	},
	{
		"chrisgrieser/nvim-rip-substitute",
		cmd = "RipSubstitute",
		keys = { { "<leader>rs", "<cmd>RipSubstitute<CR>", desc = "Rip Substitute" } },
	},

	-- File type specific
	{ "tpope/vim-markdown", ft = "markdown" },

	-- Calendar functionality
	{ "mattn/calendar-vim", cmd = "Calendar" },

	-- Git integration
	{
		"lewis6991/gitsigns.nvim",
		event = "BufReadPre",
		lazy = true,
		config = function()
			require("gitsigns").setup({
				signs = {
					add = { text = "+" },
					change = { text = "~" },
					delete = { text = "_" },
					topdelete = { text = "‾" },
					changedelete = { text = "~" },
				},
			})
		end,
	},

	-- LSP diagnostic utilities
	{
		"WhoIsSethDaniel/toggle-lsp-diagnostics.nvim",
		cmd = "ToggleLspDiagnostics",
		lazy = true,
		config = function()
			require("toggle_lsp_diagnostics").init()
		end,
	},

	-- Performance optimization
	{
		"pteroctopus/faster.nvim",
		event = "VeryLazy",
	},

	-- Vim compatibility
	{
		"tpope/vim-sleuth",
		event = "BufReadPre",
	},
}
