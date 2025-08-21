return {
	"luukvbaal/nnn.nvim",
	-- keys = {"<leader>n", "<leader>e"},
	-- lazy = true,
	config = function()
		require("nnn").setup({
			-- vim.keymap.set("n", "<leader>n", "<cmd>NnnPicker<Cr>"),
			quitcd = "cd",
			picker = {
				cmd = "nnn -eTt",
				style = {
					border = "rounded",
					height = 0.8,
					width = 0.7,
				},
				session = "shared",
			},
		})
	end,
}
