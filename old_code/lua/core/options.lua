vim.cmd("let g:netrw_liststyle = 3")

local opt = vim.opt

opt.relativenumber = true
opt.number = true


opt.autoread = true
-- opt.spell = true

-- tabs & indentation
opt.tabstop = 2 -- 2 spaces for tabs
opt.shiftwidth = 2 -- 2 spaces for indent width
opt.expandtab = true-- expand tab to spaces
opt.autoindent = false-- copy indent from current line when starting new one
opt.wrap = true --

-- search settings

opt.ignorecase = true -- ignore case when searching
opt.smartcase = true -- if you include mixed case in your search, assumes you want case-sensitive

opt.cursorline = true

-- turn on termguicolors for tokyonight colorscheme to work
opt.termguicolors = true
opt.signcolumn = "yes" -- show sign column so that text doesn't shift

-- backspace
opt.backspace = "indent,eol,start" -- allow backspace on indent, end of line or insert mode start position

-- clipboard
opt.clipboard:append("unnamedplus")

-- split windows
opt.splitright = true -- split vertical window to right
opt.splitbelow = true -- split horizontal window to the buttom



