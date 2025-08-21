local builtins = {
	"gzip",
	"zip",
	"zipPlugin",
	"tar",
	"tarPlugin",
	"getscript",
	"getscriptPlugin",
	"vimball",
	"vimballPlugin",
	"2html_plugin",
	"matchit",
	-- "matchparen",
	"logiPat",
	"rrhelper",
	"netrw",
	"netrwPlugin",
	"netrwSettings",
	"netrwFileHandlers",
}

for _, plugin in ipairs(builtins) do
	vim.g["loaded_" .. plugin] = 1
end

-- Some keyboard mappings as I don't want to break my fingers, while typing on a "german" keyboard ;)

-- Access system clipboard
local opt = vim.opt

-- metals
vim.opt_global.completeopt = { "menuone", "noinsert", "noselect" }

-- Avoid jumping on code actions
opt.numberwidth = 6

opt.clipboard = "unnamedplus"

opt.expandtab = true -- Convert tabs to spaces
opt.shiftwidth = 2 -- Amount to indent with << and >>
opt.tabstop = 2 -- How many spaces are shown per Tab
opt.softtabstop = 2 -- How many spaces are applied when pressing Tab

opt.smarttab = true
opt.smartindent = true
opt.autoindent = true -- Keep indentation from previous line

-- Enable break indent
opt.breakindent = true

-- Always show relative line numbers
opt.number = true
opt.relativenumber = true

-- Show line under cursor
opt.cursorline = true

-- Store undos between sessions
opt.undofile = true

-- Enable mouse mode, can be useful for resizing splits for example!
opt.mouse = "a"

-- Don't show the mode, since it's already in the status line
opt.showmode = false

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
opt.ignorecase = true
opt.smartcase = true

-- Keep signcolumn on by default
opt.signcolumn = "yes"

-- Configure how new splits should be opened
opt.splitright = true
opt.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
-- opt.list = true
opt.listchars = { tab = "▸␣", space = "·", nbsp = "␣", trail = "~", eol = "↲", precedes = "<", extends = ">" }

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 5

-- START folding without ufo folding
opt.foldenable = true
opt.foldlevel = 99
opt.foldmethod = "expr"
opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
opt.foldtext = ""
opt.foldcolumn = "0"
opt.fillchars:append({ fold = " " })

local function fold_virt_text(result, s, lnum, coloff)
	if not coloff then
		coloff = 0
	end
	local text = ""
	local hl
	for i = 1, #s do
		local char = s:sub(i, i)
		local hls = vim.treesitter.get_captures_at_pos(0, lnum, coloff + i - 1)
		local _hl = hls[#hls]
		if _hl then
			local new_hl = "@" .. _hl.capture
			if new_hl ~= hl then
				table.insert(result, { text, hl })
				text = ""
				hl = nil
			end
			text = text .. char
			hl = new_hl
		else
			text = text .. char
		end
	end
	table.insert(result, { text, hl })
end

function _G.custom_foldtext()
	local start = vim.fn.getline(vim.v.foldstart):gsub("\t", string.rep(" ", vim.o.tabstop))
	local end_str = vim.fn.getline(vim.v.foldend)
	local end_ = vim.trim(end_str)
	local result = {}
	fold_virt_text(result, start, vim.v.foldstart - 1)
	table.insert(result, { " ... ", "Delimiter" })
	fold_virt_text(result, end_, vim.v.foldend - 1, #(end_str:match("^(%s+)") or ""))
	return result
end

opt.foldtext = "v:lua.custom_foldtext()"

-- END folding------------------------------------------

opt.termguicolors = true -- Enable colors in terminal
opt.updatetime = 100
opt.hlsearch = true -- Set highlight on search
opt.mouse = "a" -- Enable mouse mode
opt.showmatch = true
opt.lazyredraw = false
opt.inccommand = "nosplit"

-- Highlight on yank
vim.cmd([[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
  augroup end
]])

-- Better search
opt.path:remove("/usr/include")
opt.path:append("**")
vim.cmd([[set path=.,,,$PWD/**]]) -- Set the path directly

opt.wildignorecase = true
opt.wildignore:append("**/node_modules/*")
opt.wildignore:append("**/.git/*")

--
-- vim.cmd [[
--   set foldlevel=20
--   set foldmethod=expr
--   set foldexpr=nvim_treesitter#foldexpr()
--   set shortmess-=F
-- ]]

-- update jumper filename db
vim.api.nvim_create_autocmd({ "BufNewFile", "BufReadPre" }, {
	pattern = { "*" },
	callback = function(ev)
		local filename = vim.api.nvim_buf_get_name(ev.buf)
		-- do not log .git files, and buffers opened by plugins (which often contain some ':')
		if not (string.find(filename, "/.git") or string.find(filename, ":")) then
			vim.fn.system({ "jumper", "update", "--type=files", filename })
		end
	end,
})

vim.cmd([[
  augroup cdpwd
      autocmd!
      autocmd VimEnter * cd $PWD
  augroup END
]])

vim.cmd([[
  set ff=unix
  set nocompatible
  filetype plugin indent on
  syntax on
  let g:vimwiki_listsyms = '?○◐●✔'
]])

vim.api.nvim_create_autocmd("BufReadPost", {
	pattern = { "*" },
	desc = "When editing a file, always jump to the last known cursor position",
	callback = function()
		local line = vim.fn.line("'\"")
		if
			line >= 1
			and line <= vim.fn.line("$")
			and vim.bo.filetype ~= "commit"
			and vim.fn.index({ "xxd", "gitrebase" }, vim.bo.filetype) == -1
		then
			vim.cmd('normal! g`"')
		end
	end,
})

vim.api.nvim_set_hl(0, "VimwikiHeader1", { bold = true, ctermfg = 0, fg = "#ef476f" })
vim.api.nvim_set_hl(0, "VimwikiHeader2", { bold = true, ctermfg = 0, fg = "#ffd166" })
vim.api.nvim_set_hl(0, "VimwikiHeader3", { bold = true, ctermfg = 0, fg = "#06d6a0" })
vim.api.nvim_set_hl(0, "VimwikiHeader4", { bold = true, ctermfg = 0, fg = "#118ab2" })
vim.api.nvim_set_hl(0, "VimwikiHeader5", { bold = true, ctermfg = 0, fg = "#073b4c" })

-- Auto-enable inlay hints globally when available
vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(args)
		local client = vim.lsp.get_client_by_id(args.data.client_id)
		if client and client.supports_method("textDocument/inlayHint") then
			vim.lsp.inlay_hint.enable(true, { bufnr = args.buf })
		end
	end,
})
