return {
	"nvim-telescope/telescope.nvim",
	lazy = true,
	cmd = "Telescope",
	dependencies = {
		"nvim-lua/popup.nvim",
		"nvim-lua/plenary.nvim",
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make", -- This compiles the native extension
		},
		"nvim-telescope/telescope-project.nvim",
		"nvim-telescope/telescope-dap.nvim",
		"nvim-telescope/telescope-file-browser.nvim",
		"ahmedkhalf/project.nvim",
		"nvim-telescope/telescope-frecency.nvim",
		"prochri/telescope-all-recent.nvim",
		"nvim-telescope/telescope-symbols.nvim",
		"debugloop/telescope-undo.nvim",
		{
			"adoyle-h/lsp-toggle.nvim",
			dependencies = { "keyvchan/telescope-find-pickers.nvim" },
			config = function()
				require("lsp-toggle").setup({
					create_cmds = true,
					telescope = true,
				})
			end,
		},
	},
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")

		-- Simple consistent configuration
		telescope.setup({
			defaults = {
				layout_config = {
					horizontal = { width = 0.9, height = 0.9 },
					vertical = { width = 0.9, height = 0.9 },
					center = { width = 0.9, height = 0.9 },
					cursor = { width = 0.9, height = 0.9 },
					bottom_pane = { height = 0.9 },
				},
				mappings = {
					i = {
						["<C-j>"] = actions.move_selection_next,
						["<C-k>"] = actions.move_selection_previous,
						["<C-f>"] = actions.smart_send_to_qflist + actions.open_qflist,
						["<esc>"] = actions.close,
					},
				},
			},
			extensions = {
				frecency = {
					auto_validate = false,
					matcher = "fuzzy",
					path_display = { "shorten" },
				},
			},
		})

		-- Load extensions with error handling
		pcall(telescope.load_extension, "dap")
		pcall(telescope.load_extension, "find_pickers")
		pcall(telescope.load_extension, "project")
		pcall(telescope.load_extension, "undo")
		pcall(telescope.load_extension, "file_browser")
		pcall(telescope.load_extension, "fzf") -- This will load only if compilation was successful

		-- Optional extensions that might not exist
		pcall(telescope.load_extension, "jumper")
		pcall(telescope.load_extension, "fidget")
	end,
}
