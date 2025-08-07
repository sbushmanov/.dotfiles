return {
	"nvim-telescope/telescope.nvim",
	lazy = true,
	cmd = "Telescope",
	dependencies = {
		"nvim-lua/popup.nvim",
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope-fzf-native.nvim",
		"nvim-telescope/telescope-project.nvim",
		"nvim-telescope/telescope-dap.nvim",
		-- "cljoly/telescope-repo.nvim",
		"nvim-telescope/telescope-file-browser.nvim",
		-- "ahmedkhalf/project.nvim",
		"nvim-telescope/telescope-frecency.nvim",
		"prochri/telescope-all-recent.nvim",
		"nvim-telescope/telescope-symbols.nvim",
		"debugloop/telescope-undo.nvim",
		{
			"adoyle-h/lsp-toggle.nvim",
			dependencies = { "keyvchan/telescope-find-pickers.nvim" },
			config = function()
				require("lsp-toggle").setup({
					create_cmds = true, -- Whether to create user commands
					telescope = true, -- Whether to load telescope extensions
				})
			end,
		},
	},
	config = function()
		actions = require("telescope.actions")
		defaults = {
			layout_config = {
				horizontal = { width = 0.9 },
			},
			mappings = {
				i = {
					["<C-j>"] = actions.move_selection_next,
					["<c-k>"] = actions.move_selection_previous,
					["<c-f>"] = actions.smart_send_to_qflist + actions.open_qflist,
					["<esc>"] = actions.close,
				},
			},
		}
		extensions = {
			frecency = {
				auto_validate = false,
				matcher = "fuzzy",
				path_display = { "shorten" },
			},
		}
		local telescope = require("telescope")
		telescope.load_extension("dap")
		telescope.load_extension("find_pickers")
		telescope.load_extension("project")
		telescope.load_extension("jumper")
		telescope.load_extension("undo")
		telescope.load_extension("fidget")
	end,
}
