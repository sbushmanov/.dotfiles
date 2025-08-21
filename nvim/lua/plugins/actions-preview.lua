return {
	"aznhe21/actions-preview.nvim",
	keys = {
		{
			"<leader>ca",
			function()
				require("actions-preview").code_actions()
			end,
			desc = "Code Actions Preview",
			mode = { "n", "x" },
		},
	},
	config = function()
		require("actions-preview").setup({
			-- Use default backend (no telescope dependency)
			backend = { "default" },

			-- Highlight groups
			highlight_command = {
				enable = true,
			},

			-- Telescope config (fallback if telescope is available)
			telescope = vim.F.if_nil(pcall(require, "telescope"), {
				sorting_strategy = "ascending",
				layout_strategy = "vertical",
				layout_config = {
					width = 0.8,
					height = 0.95,
					prompt_position = "top",
					preview_cutoff = 20,
					preview_height = function(_, _, max_lines)
						return max_lines - 12
					end,
				},
			}, nil),
		})
	end,
	enabled = true,
}
