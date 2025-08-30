return {
	"homerours/jumper.nvim",
	-- event = { "CursorMoved", "BufNewFile" },
	event = "VeryLazy",
	dependencies = {
		"nvim-telescope/telescope.nvim", -- for Telescope backend
		-- "ibhagwan/fzf-lua", -- alternatively, for fzf-lua backend
	},
	config = function()
		local jumper = require("telescope").extensions.jumper
		vim.keymap.set("n", "<c-y>", function()
			jumper.jump_to_directory({ on_enter = "change_cwd" })
		end)
	end,
}
