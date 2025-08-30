return {
	"nvimdev/lspsaga.nvim",
	lazy = true,
	event = "LspAttach",
	config = function()
		require("lspsaga").setup({
			ui = {
				devicon = true,
				theme = "round",
				title = true,
				border = "rounded",
				winblend = 0,
				expand = "",
				collapse = "",
				preview = " ",
				code_action = "💡",
				diagnostic = "🐞",
				incoming = " ",
				outgoing = " ",
				hover = " ",
				kind = {},
			},
			definition = {
				width = 0.9,
				height = 0.8,
			},
		})

		-- === Cached winbar with filename fallback ===
		local winbar_cache = ""

		function _G.MyWinbar()
			local ok, bar = pcall(function()
				return require("lspsaga.symbol.winbar").get_bar()
			end)
			if ok and bar ~= "" and bar ~= nil then
				winbar_cache = bar
				return bar
			end
			-- fallback to cached breadcrumbs or just filename
			return winbar_cache ~= "" and winbar_cache or "%t"
		end

		-- Set dynamic winbar using Lua function
		vim.opt.winbar = "%!v:lua.MyWinbar()"

		-- Autocmd to refresh cache when LSP updates
		vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter", "CursorHold" }, {
			callback = function()
				-- If cache empty, prefill with filename instantly
				if winbar_cache == "" then
					winbar_cache = vim.fn.expand("%t")
				end
				-- Try to update with real breadcrumbs
				local ok, bar = pcall(function()
					return require("lspsaga.symbol.winbar").get_bar()
				end)
				if ok and bar ~= "" and bar ~= nil then
					winbar_cache = bar
				end
			end,
		})
	end,
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-tree/nvim-web-devicons",
		-- "neovim/nvim-lspconfig",
	},
	enabled = true,
}
