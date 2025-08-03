return {
	"stevearc/oil.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local oil = require("oil")

		oil.setup({
			delete_to_trash = true,
			keymaps = {
				-- Inside Oil: search files in current dir with Telescope
				["ff"] = {
					function()
						require("telescope.builtin").find_files({
							cwd = oil.get_current_dir(),
						})
					end,
					mode = "n",
					desc = "Find files in the current Oil directory",
				},
				-- Inside Oil: vertical split
				["<C-s>"] = "<cmd>vs<CR>",
			},
		})
	end,
}
