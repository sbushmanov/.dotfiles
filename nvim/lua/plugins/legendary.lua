return {
	"mrjones2014/legendary.nvim",
	dependencies = { "kkharji/sqlite.lua", "stevearc/dressing.nvim" },
	cmd = { "Legendary" },
	lazy = true,
	event = "VeryLazy",
	priority = 1000,
	keys = { { "<A-z>", "<cmd>Legendary<CR>", desc = "Start Legendary" } },
	config = function()
		require("legendary").setup({
			extensions = { lazy_nvim = true },
			keymaps = {
				-- Essential non-conflicting keymaps only
				{
					"L",
					mode = { "n" },
					"<cmd>Lazy<CR>",
					desc = "Lazy dashboard",
				},
				{
					"S",
					":lua Snacks.dashboard()<CR>",
					mode = { "n" },
					description = "Display Snacks dashboard",
				},
				{
					"N",
					"<cmd>NnnPicker %:p:h<CR>",
					mode = { "n" },
					description = "Open NNN picker floating window",
				},
				{
					"C",
					"<cmd>NnnPicker /home/sergey/.dotfiles/nvim<CR>",
					mode = { "n" },
					description = "Open NNN picker in nvim config",
				},
				{
					"E",
					"<cmd>NnnExplorer %:p:h<CR>",
					mode = { "n" },
					description = "Open NNN explorer side bar",
				},
				{
					"<C-u>",
					"<cmd>lua require('telescope').extensions.jumper.jump_to_file()<CR>",
					mode = { "n" },
					description = "Jumper to file",
				},
				{
					"<C-y>",
					"<cmd>lua require('telescope').extensions.jumper.jump_to_directory()<CR>",
					mode = { "n" },
					description = "Jumper to directory",
				},
				{
					"<leader>ut",
					":UndotreeToggle<cr>",
					mode = { "n", "x", "o" },
					description = "Undo tree toggle",
				},
				{
					"<leader>ll",
					"<cmd>Oil --float %:h<cr>",
					mode = { "n" },
					description = "Oil floating file explorer",
				},
				{
					"<leader>ra",
					"Vgg :SnipRun<CR>",
					description = "SnipRun: execute above current line (to top)",
				},
				{
					"<leader>rb",
					"VG :SnipRun<CR>",
					description = "SnipRun: execute below current line (to bottom)",
				},
				{
					"<leader>r",
					":SnipRun<CR>",
					mode = "v",
					description = "SnipRun: execute visual selection",
				},
				{
					"<leader><leader>",
					":lua require'telescope'.extensions.metals.commands()<cr>",
					description = "Metals menu",
				},
				{
					"<A-t>",
					":Telescope<cr>",
					description = "All telescope menus (pickers)",
				},
				{
					"<A-f>",
					":FzfLua<cr>",
					description = "All Fzf.lua menus (pickers)",
				},
				{
					"<leader>fh",
					":Telescope frecency<cr>",
					description = "Metals menu",
				},
				{ "<leader>dr", ":lua require('dap').repl.toggle({}, 'vsplit new')<cr>", description = "DAP repl" },
				{ "<leader>db", ":DapToggleBreakpoint<cr>", description = "DAP insert breakpoint" },
				{
					"<A-o>",
					"<cmd>Lspsaga outline<CR>",
					description = "Lspsaga project outline",
				},
				{
					"?",
					"<cmd>Lspsaga hover_doc<CR>",
					description = "Lspsaga hover doc",
				},
				{
					"<A-e>",
					"<cmd>Lspsaga term_toggle<CR>",
					description = "Lspsaga toggle terminal",
				},
				{
					"H",
					":lua vim.lsp.buf.hover()<CR>",
					description = "Metals hover",
				},
				{
					"<A-k>",
					function()
						vim.lsp.buf.signature_help()
					end,
					description = "Metals function signature",
				},
			},
		})
	end,
}
