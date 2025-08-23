return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	opts = {
		-- your configuration comes here
		-- or leave it empty to use the default settings
		-- refer to the configuration section below
		styles = {
			scratch = {
				width = 0.8,
				height = 0.8,
				bo = { buftype = "", buflisted = false, bufhidden = "hide", swapfile = false },
				minimal = false,
				noautocmd = false,
				-- position = "right",
				zindex = 20,
				wo = { winhighlight = "NormalFloat:Normal" },
				border = "rounded",
				title_pos = "center",
				footer_pos = "center",
			},
		},
		bigfile = { enabled = true },
		dashboard = {
			enabled = true,
			preset = {
				header = false,
				keys = {
					{ icon = " ", key = "f", desc = "Find File", action = ":lua require('fff').find_files()" },
					-- { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
					{
						icon = " ",
						key = "g",
						desc = "Find Text",
						action = ":lua Snacks.dashboard.pick('live_grep')",
					},
					{
						icon = " ",
						key = "r",
						desc = "Recent Files",
						action = ":lua Snacks.dashboard.pick('oldfiles')",
					},
					{
						icon = " ",
						key = "c",
						desc = "Config",
						action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})",
					},
					-- { icon = " ", key = "s", desc = "Restore Session", section = "session" },
					-- {
					-- 	icon = "󰒲 ",
					-- 	key = "L",
					-- 	desc = "Lazy",
					-- 	action = ":Lazy",
					-- 	enabled = package.loaded.lazy ~= nil,
					-- },
					{ icon = "📚", key = "w", desc = "Vimwiki", action = "<cmd>VimwikiIndex<CR>" },
					{ section = "recent_files", icon = " ", title = "Recent Files", indent = 3, padding = 2 },
				},
			},
		},
		indent = { enabled = true },
		input = { enabled = true },
		notifier = { enabled = true },
		quickfile = { enabled = true },
		scroll = { enabled = true },
		statuscolumn = { enabled = true },
		words = { enabled = true },
		explorer = {
			enabled = true,
			-- Optional: customize if desired
			netrw = false, -- disable netrw if using snacks explorer
			icons = {
				directory = "",
				file = "",
				symlink = "",
			},
		},
		finder = {
			recent_projects = {},
		},

		-- 2. Enable Picker (you have extensive picker mappings)
		picker = {
			enabled = true,
			-- Optional: customize layout
			layout = {
				width = 0.9,
				height = 0.8,
				border = "rounded",
			},
			sources = {
				projects = {
					-- finder = "recent_projects", -- This tells the picker to use the finder defined above
					format = "file",
					-- 'dev' and 'patterns' are removed from here
					confirm = "load_session",
					-- 'matcher' and 'sort' stay here as they are about sorting the results in the UI
					patterns = {
						".git",
						"_darcs",
						".hg",
						".bzr",
						".svn",
						"package.json",
						"Makefile",
						".sbt",
						".bloop",
						".metals",
						"README.md",
						"readme.md",
						"README",
						"readme",
					},
					-- dev is a dir just above root
					dev = { "~", "~/Scala_Pragmatic_Scala/", "~/Dev_Scala/" },

					matcher = {
						frecency = true,
						sort_empty = true,
						cwd_bonus = false,
					},
					sort = { fields = { "score:desc", "idx" } },
					win = {
						preview = { minimal = true },
						input = {
							keys = {
								-- every action will always first change the cwd of the current tabpage to the project
								["<c-e>"] = { { "tcd", "picker_explorer" }, mode = { "n", "i" } },
								["<CR>"] = { { "tcd", "picker_files" }, mode = { "n", "i" } },
								["<c-g>"] = { { "tcd", "picker_grep" }, mode = { "n", "i" } },
								["<c-r>"] = { { "tcd", "picker_recent" }, mode = { "n", "i" } },
								["<c-w>"] = { { "tcd" }, mode = { "n", "i" } },
								["<c-t>"] = {
									function(picker)
										vim.cmd("tabnew")
										Snacks.notify("New tab opened")
										picker:close()
										Snacks.picker.projects()
									end,
									mode = { "n", "i" },
								},
							},
						},
					},
				},
			},
		},

		-- 3. Enable Scope (useful for code navigation)
		scope = {
			enabled = true,
			show_icons = true,
			highlight_hovered = true,
		},

		-- 4. Enable Image support (your healthcheck shows good terminal support)
		image = {
			enabled = true,
			-- Your terminal supports kitty protocol and wezterm
			preferred_protocol = "wezterm", -- or "kitty"
			fallback_protocol = "chafa",
			inline_in_docs = true,
			max_width = 80,
			max_height = 40,
		},

		-- 5. Enable Terminal integration
		terminal = {
			enabled = true,
			shell = "/usr/bin/fish", -- matches your current shell
			direction = "horizontal", -- or "vertical", "float"
			size = 15,
		},

		-- 6. Enable Debug utilities (you already use them in init)
		debug = {
			enabled = true,
			inspect_depth = 5,
		},

		-- 7. Enable Zen mode (you have mappings for it)
		zen = {
			enabled = true,
			width = 0.85,
			height = 0.9,
			twilight = true,
		},

		-- 8. Enable Git integration
		git = {
			enabled = true,
			browse = {
				remote = "origin",
				action = "open", -- or "copy"
			},
		},
	},
	keys = {
		-- Top Pickers & Explorer
		{
			"<leader>,",
			function()
				Snacks.picker.buffers()
			end,
			desc = "Buffers",
		},
		{
			"<leader>/",
			function()
				Snacks.picker.grep()
			end,
			desc = "Grep",
		},
		{
			"<leader>:",
			function()
				Snacks.picker.command_history()
			end,
			desc = "Command History",
		},
		{
			"<leader>sn",
			function()
				Snacks.picker.notifications()
			end,
			desc = "Notification History",
		},
		{
			"<leader>se",
			function()
				Snacks.explorer()
			end,
			desc = "File Explorer",
		},
		-- find
		{
			"<leader>fb",
			function()
				Snacks.picker.buffers()
			end,
			desc = "Buffers",
		},
		{
			"<leader>sc",
			function()
				Snacks.picker.files({ cwd = vim.fn.stdpath("config") })
			end,
			desc = "Find Config File",
		},
		{
			"<leader>sP",
			function()
				Snacks.picker.projects()
			end,
			desc = "Projects",
		},
		{
			"<leader>fP",
			function()
				Snacks.picker.projects()
			end,
			desc = "Projects",
		},
		{
			"<leader>fr",
			function()
				Snacks.picker.recent()
			end,
			desc = "Recent",
		},
		{
			"<leader>sr",
			function()
				Snacks.picker.recent()
			end,
			desc = "Recent",
		},
		-- git
		{
			"<leader>gb",
			function()
				Snacks.picker.git_branches()
			end,
			desc = "Git Branches",
		},
		{
			"<leader>gl",
			function()
				Snacks.picker.git_log()
			end,
			desc = "Git Log",
		},
		{
			"<leader>gL",
			function()
				Snacks.picker.git_log_line()
			end,
			desc = "Git Log Line",
		},
		{
			"<leader>gs",
			function()
				Snacks.picker.git_status()
			end,
			desc = "Git Status",
		},
		{
			"<leader>gS",
			function()
				Snacks.picker.git_stash()
			end,
			desc = "Git Stash",
		},
		{
			"<leader>gd",
			function()
				Snacks.picker.git_diff()
			end,
			desc = "Git Diff (Hunks)",
		},
		{
			"<leader>gf",
			function()
				Snacks.picker.git_log_file()
			end,
			desc = "Git Log File",
		},
		-- Grep
		{
			"<leader>sb",
			function()
				Snacks.picker.lines()
			end,
			desc = "Buffer Lines",
		},
		{
			"<leader>sB",
			function()
				Snacks.picker.grep_buffers()
			end,
			desc = "Grep Open Buffers",
		},
		{
			"<leader>sg",
			function()
				Snacks.picker.grep()
			end,
			desc = "Grep",
		},
		{
			"<leader>sw",
			function()
				Snacks.picker.grep_word()
			end,
			desc = "Visual selection or word",
			mode = { "n", "x" },
		},
		-- search
		{
			'<leader>s"',
			function()
				Snacks.picker.registers()
			end,
			desc = "Registers",
		},
		{
			"<leader>s/",
			function()
				Snacks.picker.search_history()
			end,
			desc = "Search History",
		},
		{
			"<leader>sa",
			function()
				Snacks.picker.autocmds()
			end,
			desc = "Autocmds",
		},
		{
			"<leader>sc",
			function()
				Snacks.picker.command_history()
			end,
			desc = "Command History",
		},
		{
			"<leader>sC",
			function()
				Snacks.picker.commands()
			end,
			desc = "Commands",
		},
		{
			"<leader>sd",
			function()
				Snacks.picker.diagnostics()
			end,
			desc = "Diagnostics",
		},
		{
			"<leader>sD",
			function()
				Snacks.picker.diagnostics_buffer()
			end,
			desc = "Buffer Diagnostics",
		},
		{
			"<leader>sh",
			function()
				Snacks.picker.help()
			end,
			desc = "Help Pages",
		},
		{
			"<leader>sH",
			function()
				Snacks.picker.highlights()
			end,
			desc = "Highlights",
		},
		{
			"<leader>si",
			function()
				Snacks.picker.icons()
			end,
			desc = "Icons",
		},
		{
			"<leader>sj",
			function()
				Snacks.picker.jumps()
			end,
			desc = "Jumps",
		},
		{
			"<leader>sk",
			function()
				Snacks.picker.keymaps()
			end,
			desc = "Keymaps",
		},
		{
			"<leader>sl",
			function()
				Snacks.picker.loclist()
			end,
			desc = "Location List",
		},
		{
			"<leader>sm",
			function()
				Snacks.picker.marks()
			end,
			desc = "Marks",
		},
		{
			"<leader>sM",
			function()
				Snacks.picker.man()
			end,
			desc = "Man Pages",
		},
		{
			"<leader>sp",
			function()
				Snacks.picker.lazy()
			end,
			desc = "Search for Plugin Spec",
		},
		{
			"<leader>sq",
			function()
				Snacks.picker.qflist()
			end,
			desc = "Quickfix List",
		},
		{
			"<leader>sR",
			function()
				Snacks.picker.resume()
			end,
			desc = "Resume",
		},
		{
			"<leader>su",
			function()
				Snacks.picker.undo()
			end,
			desc = "Undo History",
		},
		{
			"<leader>uC",
			function()
				Snacks.picker.colorschemes()
			end,
			desc = "Colorschemes",
		},
		-- LSP
		{
			"gd",
			function()
				Snacks.picker.lsp_definitions()
			end,
			desc = "Goto Definition",
		},
		{
			"gD",
			function()
				Snacks.picker.lsp_declarations()
			end,
			desc = "Goto Declaration",
		},
		{
			"gr",
			function()
				Snacks.picker.lsp_references()
			end,
			nowait = true,
			desc = "References",
		},
		{
			"gI",
			function()
				Snacks.picker.lsp_implementations()
			end,
			desc = "Goto Implementation",
		},
		{
			"gy",
			function()
				Snacks.picker.lsp_type_definitions()
			end,
			desc = "Goto T[y]pe Definition",
		},
		{
			"<leader>ss",
			function()
				Snacks.picker.lsp_symbols()
			end,
			desc = "LSP Symbols",
		},
		{
			"<leader>sS",
			function()
				Snacks.picker.lsp_workspace_symbols()
			end,
			desc = "LSP Workspace Symbols",
		},
		-- Other
		{
			"<leader>z",
			function()
				Snacks.zen()
			end,
			desc = "Toggle Zen Mode",
		},
		{
			"<leader>Z",
			function()
				Snacks.zen.zoom()
			end,
			desc = "Toggle Zoom",
		},
		{
			"<leader>.",
			function()
				Snacks.scratch()
			end,
			desc = "Toggle Scratch Buffer",
		},
		{
			"<leader>S",
			function()
				Snacks.scratch.select()
			end,
			desc = "Select Scratch Buffer",
		},
		{
			"<leader>n",
			function()
				Snacks.notifier.show_history()
			end,
			desc = "Notification History",
		},
		{
			"<leader>bd",
			function()
				Snacks.bufdelete()
			end,
			desc = "Delete Buffer",
		},
		{
			"<leader>cR",
			function()
				Snacks.rename.rename_file()
			end,
			desc = "Rename File",
		},
		{
			"<leader>gB",
			function()
				Snacks.gitbrowse()
			end,
			desc = "Git Browse",
			mode = { "n", "v" },
		},
		{
			"<leader>gg",
			function()
				Snacks.lazygit()
			end,
			desc = "Lazygit",
		},
		{
			"<leader>un",
			function()
				Snacks.notifier.hide()
			end,
			desc = "Dismiss All Notifications",
		},
		{
			"<c-/>",
			function()
				Snacks.terminal()
			end,
			desc = "Toggle Terminal",
		},
		{
			"<c-_>",
			function()
				Snacks.terminal()
			end,
			desc = "which_key_ignore",
		},
		{
			"]]",
			function()
				Snacks.words.jump(vim.v.count1)
			end,
			desc = "Next Reference",
			mode = { "n", "t" },
		},
		{
			"[[",
			function()
				Snacks.words.jump(-vim.v.count1)
			end,
			desc = "Prev Reference",
			mode = { "n", "t" },
		},
	},
	init = function()
		vim.api.nvim_create_autocmd("User", {
			pattern = "VeryLazy",
			callback = function()
				-- Setup some globals for debugging (lazy-loaded)
				_G.dd = function(...)
					Snacks.debug.inspect(...)
				end
				_G.bt = function()
					Snacks.debug.backtrace()
				end
				vim.print = _G.dd -- Override print to use snacks for `:=` command

				-- Create some toggle mappings
				Snacks.toggle.option("spell", { name = "Spelling" }):map("<leader>us")
				Snacks.toggle.option("wrap", { name = "Wrap" }):map("<leader>uw")
				Snacks.toggle.option("relativenumber", { name = "Relative Number" }):map("<leader>uL")
				Snacks.toggle.diagnostics():map("<leader>ud")
				Snacks.toggle.line_number():map("<leader>ul")
				Snacks.toggle
					.option("conceallevel", { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2 })
					:map("<leader>uc")
				Snacks.toggle.treesitter():map("<leader>uT")
				Snacks.toggle
					.option("background", { off = "light", on = "dark", name = "Dark Background" })
					:map("<leader>ub")
				Snacks.toggle.inlay_hints():map("<leader>uh")
				Snacks.toggle.indent():map("<leader>ug")
				Snacks.toggle.dim():map("<leader>uD")
			end,
		})
	end,
}
