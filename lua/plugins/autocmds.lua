-- Create an augroup to organize your autocmds
local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

local NishantGroup = augroup("NishantAutoCmds", { clear = true })

-- Highlight yanked text
autocmd("TextYankPost", {
  group = NishantGroup,
  pattern = "*",
  callback = function()
    vim.highlight.on_yank({ timeout = 200 })
  end,
})

-- Automatically reload file when changed outside
autocmd({ "FocusGained", "BufEnter" }, {
  group = NishantGroup,
  pattern = "*",
  command = "checktime",
})

-- Remove trailing whitespace on save
autocmd("BufWritePre", {
  group = NishantGroup,
  pattern = "*",
  callback = function()
    local save = vim.fn.winsaveview()
    vim.cmd([[ %s/\s\+$//e ]])
    vim.fn.winrestview(save)
  end,
})

