-- local api = vim.api
local g = vim.g
local opt = vim.opt

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

vim.g.loaded_ruby_provider = 0

-- Remap leader and local leader to <Space>
vim.keymap.set("", "<Space>", "<Nop>", { noremap = true, silent = true })
g.mapleader = " "
g.maplocalleader = ";"
g.python3_host_prog = "/home/sergey/anaconda3/bin/python"
-- g.pf_autorun_delay = 0.5

opt.termguicolors = true -- Enable colors in terminal
opt.updatetime = 100
opt.hlsearch = true -- Set highlight on search
opt.number = true -- Make line numbers default
opt.relativenumber = true -- Make relative number default
opt.mouse = "a" -- Enable mouse mode
opt.breakindent = true -- Enable break indent
opt.undofile = true -- Save undo history
opt.ignorecase = true -- Case insensitive searching unless /C or capital in search
opt.smartcase = true -- Smart case
opt.signcolumn = "yes" -- Always show sign column
opt.clipboard = "unnamedplus" -- Access system clipboard
opt.showmatch = true
opt.cursorline = true
opt.lazyredraw = true
opt.autoindent = true
opt.splitright = true
opt.inccommand = "nosplit"

-- Tab
opt.tabstop = 2
opt.shiftwidth = 2
opt.softtabstop = 2
opt.expandtab = true

-- Non printable
opt.listchars = { tab = "▸␣", space = "·", nbsp = "␣", trail = "~", eol = "↲", precedes = "<", extends = ">" }
-- opt.list = false

vim.diagnostic.config({
	float = { border = "rounded" },
})

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

-- START folding without ufo folding
-- opt.foldenable = true
-- opt.foldlevel = 99
-- opt.foldmethod = "expr"
-- opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
-- opt.foldtext = ""
-- opt.foldcolumn = "0"
-- opt.fillchars:append({ fold = " " })
--
-- vim.keymap.set("n", "zR", ":set foldlevel=99<CR>")
-- vim.keymap.set("n", "zM", ":set foldlevel=0<CR>")
--
-- local function fold_virt_text(result, s, lnum, coloff)
-- 	if not coloff then
-- 		coloff = 0
-- 	end
-- 	local text = ""
-- 	local hl
-- 	for i = 1, #s do
-- 		local char = s:sub(i, i)
-- 		local hls = vim.treesitter.get_captures_at_pos(0, lnum, coloff + i - 1)
-- 		local _hl = hls[#hls]
-- 		if _hl then
-- 			local new_hl = "@" .. _hl.capture
-- 			if new_hl ~= hl then
-- 				table.insert(result, { text, hl })
-- 				text = ""
-- 				hl = nil
-- 			end
-- 			text = text .. char
-- 			hl = new_hl
-- 		else
-- 			text = text .. char
-- 		end
-- 	end
-- 	table.insert(result, { text, hl })
-- end
--
-- function _G.custom_foldtext()
-- 	local start = vim.fn.getline(vim.v.foldstart):gsub("\t", string.rep(" ", vim.o.tabstop))
-- 	local end_str = vim.fn.getline(vim.v.foldend)
-- 	local end_ = vim.trim(end_str)
-- 	local result = {}
-- 	fold_virt_text(result, start, vim.v.foldstart - 1)
-- 	table.insert(result, { " ... ", "Delimiter" })
-- 	fold_virt_text(result, end_, vim.v.foldend - 1, #(end_str:match("^(%s+)") or ""))
-- 	return result
-- end
--
-- vim.opt.foldtext = "v:lua.custom_foldtext()"

-- END folding------------------------------------------

vim.api.nvim_set_hl(0, "VimwikiHeader1", { bold = true, ctermfg = 0, fg = "#ef476f" })
vim.api.nvim_set_hl(0, "VimwikiHeader2", { bold = true, ctermfg = 0, fg = "#ffd166" })
vim.api.nvim_set_hl(0, "VimwikiHeader3", { bold = true, ctermfg = 0, fg = "#06d6a0" })
vim.api.nvim_set_hl(0, "VimwikiHeader4", { bold = true, ctermfg = 0, fg = "#118ab2" })
vim.api.nvim_set_hl(0, "VimwikiHeader5", { bold = true, ctermfg = 0, fg = "#073b4c" })
