return {
	"aznhe21/actions-preview.nvim",
	-- event = { "BufReadPre", "BufNewFile" },
	event = { "LspAttach" },
	priority = 100,
	config = function()
		vim.keymap.set(
			{ "v", "n" },
			"<leader>p",
			require("actions-preview").code_actions,
			{ desc = "Show code actions preview" }
		)
		require("actions-preview").setup({
			telescope = {
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
			},
		})
	end,
	enabled = true,
	snacks = {
		layout = { preset = "default" },
	},
}
