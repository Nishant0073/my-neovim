-- File: ~/.config/nvim/lua/myconfig/core/autocommands.lua

local api = vim.api

-- Create a helper function for defining autocommand groups
local function augroup(name)
  return api.nvim_create_augroup("MyConfig_" .. name, { clear = true })
end

-- Highlight yanked text
api.nvim_create_autocmd("TextYankPost", {
  group = augroup("HighlightYank"),
  pattern = "*",
  callback = function()
    vim.highlight.on_yank({ timeout = 150 })
  end,
})

-- Remove trailing whitespace on save
api.nvim_create_autocmd("BufWritePre", {
  group = augroup("TrimWhitespace"),
  pattern = "*",
  callback = function()
    local save = vim.fn.winsaveview()
    vim.cmd([[ %s/\s\+$//e ]])
    vim.fn.winrestview(save)
  end,
})

-- Enable spell checking for markdown and git commit messages
api.nvim_create_autocmd("FileType", {
  group = augroup("SpellMarkdownGit"),
  pattern = { "markdown", "gitcommit" },
  callback = function()
    vim.opt_local.spell = true
    vim.opt_local.wrap = true
  end,
})

-- Resize splits when the window is resized
api.nvim_create_autocmd("VimResized", {
  group = augroup("ResizeSplits"),
  callback = function()
    vim.cmd("tabdo wincmd =")
  end,
})

-- Set filetype for .csx files as C#
api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  group = augroup("CSharpScript"),
  pattern = "*.csx",
  callback = function()
    vim.bo.filetype = "cs"
  end,
})

-- Auto-create missing directories on save
api.nvim_create_autocmd("BufWritePre", {
  group = augroup("AutoMkdir"),
  callback = function(args)
    local dir = vim.fn.fnamemodify(args.file, ":p:h")
    if vim.fn.isdirectory(dir) == 0 then
      vim.fn.mkdir(dir, "p")
    end
  end,
})

-- Disable line numbers in terminal buffers
api.nvim_create_autocmd("TermOpen", {
  group = augroup("TerminalSettings"),
  callback = function()
    vim.opt_local.number = false
    vim.opt_local.relativenumber = false
    vim.opt_local.signcolumn = "no"
  end,
})

