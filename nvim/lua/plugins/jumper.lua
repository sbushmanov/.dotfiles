return {
	"homerours/jumper.nvim",
	event = { "CursorMoved", "BufNewFile" },
	-- event = "VeryLazy",
	dependencies = {
		"nvim-telescope/telescope.nvim", -- for Telescope backend
		-- "ibhagwan/fzf-lua", -- alternatively, for fzf-lua backend
	},
	config = function()
		local jumper = require("telescope").extensions.jumper
	end,
}
