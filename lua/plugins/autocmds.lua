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

-- Auto-save on InsertLeave and TextChanged (Normal mode)
autocmd({ "InsertLeave", "TextChanged" }, {
  group = NishantGroup,
  pattern = "*",
  callback = function()
    -- Only save if buffer is modifiable and not read-only
    if vim.bo.modified and vim.bo.modifiable and not vim.bo.readonly then
      vim.cmd("silent! write")
    end
  end,
})


vim.api.nvim_create_autocmd("FileType", {
  pattern = "dart",
  callback = function()
    vim.bo.formatprg = "dart format -"
  end,
})

