return {
	{
		"nvim-telescope/telescope.nvim",
		lazy = true,
		cmd = "Telescope",
		keys = {
			{ "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
			{ "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Live Grep" },
			{ "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
			{ "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Help" },
		},
		-- event = { "CursorMoved", "BufNewFile" },
		dependencies = {
			"nvim-lua/popup.nvim",
			"nvim-lua/plenary.nvim",
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				build = "make",
			},
			"nvim-telescope/telescope-file-browser.nvim",
			"nvim-telescope/telescope-frecency.nvim",
			"prochri/telescope-all-recent.nvim",
			"nvim-telescope/telescope-symbols.nvim",
			"debugloop/telescope-undo.nvim",
		},
		config = function()
			local telescope = require("telescope")
			local actions = require("telescope.actions")

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
					undo = {
						use_delta = true,
						side_by_side = false,
						vim_diff_opts = { ctxlen = 8 },
						entry_format = "state #$ID, $STAT, $TIME",
						time_format = "",
						saved_only = false,
					},
				},
			})

			-- Load other extensions
			pcall(telescope.load_extension, "find_pickers")
			pcall(telescope.load_extension, "undo")
			pcall(telescope.load_extension, "file_browser")
			pcall(telescope.load_extension, "fzf")
			pcall(telescope.load_extension, "jumper")
			pcall(telescope.load_extension, "fidget")
		end,
	},

	-- 🔹 telescope-dap: separate plugin, lazy load on DAP session
	{
		"nvim-telescope/telescope-dap.nvim",
		dependencies = { "nvim-telescope/telescope.nvim", "mfussenegger/nvim-dap" },
		lazy = true,
		config = function()
			local ok, dap = pcall(require, "dap")
			if not ok then
				return
			end

			dap.listeners.after.event_initialized["telescope-dap"] = function()
				local telescope = require("telescope")
				pcall(telescope.load_extension, "dap")
			end
		end,
	},
}
