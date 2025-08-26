return {
	{
		"saghen/blink.compat",
		version = "*",
		lazy = true,
		event = "InsertEnter",
	},
	{
		"saghen/blink.cmp",
		lazy = true,
		event = "InsertEnter",
		dependencies = {
			"rafamadriz/friendly-snippets",
			"moyiz/blink-emoji.nvim",
			"ray-x/cmp-sql",
		},
		version = "1.*",

		---@module 'blink.cmp'
		---@type blink.cmp.Config
		opts = {
			-- Keymap configuration
			keymap = {
				preset = "default",
				["<CR>"] = { "accept", "fallback" },
				["<Tab>"] = { "select_next", "fallback" },
				["<S-Tab>"] = { "select_prev", "fallback" },
			},

			-- Appearance configuration
			appearance = {
				nerd_font_variant = "mono",
			},

			-- Completion settings
			completion = {
				documentation = { auto_show = true },
				list = {
					selection = { preselect = true, auto_insert = true },
				},
			},

			-- Signature settings (top level)
			signature = { enabled = true },

			-- Cmdline settings
			cmdline = {
				keymap = {
					preset = "default",
				},
				completion = { menu = { auto_show = true } },
			},

			-- Sources configuration
			sources = {
				default = { "lsp", "path", "snippets", "buffer", "emoji", "sql" },
				providers = {
					emoji = {
						module = "blink-emoji",
						name = "Emoji",
						score_offset = 15,
						opts = { insert = true },
						should_show_items = function()
							return vim.tbl_contains({ "gitcommit", "markdown" }, vim.o.filetype)
						end,
					},
					sql = {
						name = "sql",
						module = "blink.compat.source",
						score_offset = -3,
						opts = {},
						should_show_items = function()
							return vim.tbl_contains(
								{ "sql", "mysql", "pgsql" }, -- Added more SQL filetypes for better coverage
								vim.o.filetype
							)
						end,
					},
				},
			},

			-- Fuzzy matching configuration
			fuzzy = { implementation = "prefer_rust_with_warning" },
		},

		-- opts_extend should be outside of opts
		opts_extend = { "sources.default" },
	},
}
