-- File: ~/.config/nvim/lua/myconfig/core/options.lua

-- Set leader key
vim.g.mapleader = ","

-- Use vim.opt for cleaner API access
local opt = vim.opt

-- ================================================
-- General
-- ================================================

opt.encoding = "utf-8"            -- Always use UTF-8 encoding
opt.fileencoding = "utf-8"        -- File encoding to write files
opt.swapfile = false              -- Disable swap files
opt.backup = false                -- Disable backup files
opt.undofile = true               -- Persistent undo history across sessions

opt.hidden = true                 -- Allow buffers to be hidden (without saving)
opt.mouse = "a"                   -- Enable mouse support in all modes
opt.clipboard = "unnamedplus"    -- Use system clipboard
opt.updatetime = 300              -- Faster completion & diagnostics (default is 4000)
opt.timeoutlen = 500              -- Time to wait for mapped sequence (in milliseconds)

-- ================================================
-- UI
-- ================================================

opt.number = true                 -- Show line numbers
opt.relativenumber = true        -- Relative line numbers
opt.cursorline = true            -- Highlight current line
opt.termguicolors = true         -- Enable true color support
opt.signcolumn = "yes"           -- Always show sign column (for Git/LSP/etc.)
opt.scrolloff = 8                -- Minimum lines above/below cursor
opt.sidescrolloff = 8            -- Minimum columns left/right of cursor
opt.wrap = false                 -- Disable line wrap

opt.splitright = true            -- Vertical splits to the right
opt.splitbelow = true            -- Horizontal splits below

opt.showmode = false             -- Don't show -- INSERT -- in command line (statusline handles this)

-- ================================================
-- Tabs & Indentation
-- ================================================

opt.tabstop = 4                  -- Number of spaces a <Tab> counts for
opt.shiftwidth = 4               -- Size of an indent
opt.expandtab = true             -- Use spaces instead of tabs
opt.smartindent = true           -- Autoindent new lines smartly
opt.autoindent = true            -- Copy indent from current line when starting new one

-- ================================================
-- Search
-- ================================================

opt.ignorecase = true            -- Case insensitive searching...
opt.smartcase = true             -- ...unless capital letters are used
opt.hlsearch = true              -- Highlight search matches
opt.incsearch = true             -- Show matches as you type

-- ================================================
-- Backspace behavior
-- ================================================

opt.backspace = { "indent", "eol", "start" } -- Make backspace behave like in most editors

-- ================================================
-- Command line & Completion
-- ================================================

opt.wildmode = { "longest", "list", "full" } -- Command-line completion behavior
opt.completeopt = { "menu", "menuone", "noselect" } -- Autocomplete behavior
opt.pumheight = 10              -- Limit completion menu height

-- ================================================
-- Fold settings
-- ================================================

opt.foldmethod = "expr"          -- Use expression folding
opt.foldexpr = "nvim_treesitter#foldexpr()" -- Treesitter-based folding
opt.foldenable = false           -- Start with all folds open

-- ================================================
-- Window & UI enhancements
-- ================================================

opt.laststatus = 3               -- Global statusline (Neovim 0.7+)
opt.showtabline = 2              -- Always show tabline
opt.title = true                 -- Set the terminal title to current file

-- ================================================
-- Misc
-- ================================================

opt.confirm = true               -- Prompt to save changes before closing
opt.virtualedit = "block"        -- Allow cursor to move where there is no text in visual block mode

-- ================================================
-- For faster editing of large files
-- ================================================

opt.lazyredraw = true            -- Don't redraw during macros and other events
opt.synmaxcol = 300              -- Stop syntax highlight after x columns (performance)

-- ================================================
-- Neovim GUI (e.g., Neovide) tweaks (optional)
-- ================================================

if vim.g.neovide then
  opt.guifont = "FiraCode Nerd Font:h14"
  vim.g.neovide_transparency = 0.95
end

