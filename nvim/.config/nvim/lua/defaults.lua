-- local api = vim.api
local g   = vim.g
local opt = vim.opt

-- Remap leader and local leader to <Space>
vim.keymap.set("", "<Space>", "<Nop>", { noremap = true, silent = true })
g.mapleader         = " "
g.maplocalleader    = ";"
g.python3_host_prog = "/home/sergey/anaconda3/bin/python3"
-- g.pf_autorun_delay = 0.5

opt.termguicolors   = true         -- Enable colors in terminal
opt.updatetime      = 100
opt.hlsearch        = true         -- Set highlight on search
opt.number          = true         -- Make line numbers default
opt.relativenumber  = true         -- Make relative number default
opt.mouse           = "a"          -- Enable mouse mode
opt.breakindent     = true         -- Enable break indent
opt.undofile        = true         -- Save undo history
opt.ignorecase      = true         -- Case insensitive searching unless /C or capital in search
opt.smartcase       = true         -- Smart case
opt.signcolumn      = "yes"        -- Always show sign column
opt.clipboard       = "unnamedplus" -- Access system clipboard
opt.showmatch       = true
opt.cursorline      = true
opt.lazyredraw      = true
opt.autoindent      = true
opt.splitright      = true
opt.inccommand      = "nosplit"

-- Tab
opt.tabstop         = 2
opt.shiftwidth      = 2
opt.softtabstop     = 2
opt.expandtab       = true

-- Non printable
opt.listchars       = { tab = '▸␣', space = '·', nbsp = '␣', trail = '~', eol = '↲', precedes = '<', extends = '>' }
-- opt.list = false

-- FZF fzf#run
vim.cmd [[ set rtp += "~/.fzf/"]]

vim.diagnostic.config {
  float = { border = "rounded" },
}

-- Highlight on yank
vim.cmd [[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
  augroup end
]]

-- Better search
opt.path:remove "/usr/include"
opt.path:append "**"
vim.cmd [[set path=.,,,$PWD/**]] -- Set the path directly

opt.wildignorecase = true
opt.wildignore:append "**/node_modules/*"
opt.wildignore:append "**/.git/*"

--
-- vim.cmd [[
--   set foldlevel=20
--   set foldmethod=expr
--   set foldexpr=nvim_treesitter#foldexpr()
--   set shortmess-=F
-- ]]

vim.cmd [[
  augroup cdpwd
      autocmd!
      autocmd VimEnter * cd $PWD
  augroup END
]]

vim.cmd [[
  set ff=unix
  set nocompatible
  filetype plugin indent on
  syntax on
  let g:vimwiki_listsyms = '?○◐●✔'
]]

vim.api.nvim_create_autocmd('BufReadPost', {
  pattern = { '*' },
  desc = 'When editing a file, always jump to the last known cursor position',
  callback = function()
    local line = vim.fn.line '\'"'
    if
        line >= 1
        and line <= vim.fn.line '$'
        and vim.bo.filetype ~= 'commit'
        and vim.fn.index({ 'xxd', 'gitrebase' }, vim.bo.filetype) == -1
    then
      vim.cmd 'normal! g`"'
    end
  end,
})

vim.api.nvim_set_hl(0, "VimwikiHeader1", { bold = true, ctermfg = 0, fg = '#ef476f' })
vim.api.nvim_set_hl(0, "VimwikiHeader2", { bold = true, ctermfg = 0, fg = '#ffd166' })
vim.api.nvim_set_hl(0, "VimwikiHeader3", { bold = true, ctermfg = 0, fg = '#06d6a0' })
vim.api.nvim_set_hl(0, "VimwikiHeader4", { bold = true, ctermfg = 0, fg = '#118ab2' })
vim.api.nvim_set_hl(0, "VimwikiHeader5", { bold = true, ctermfg = 0, fg = '#073b4c' })
