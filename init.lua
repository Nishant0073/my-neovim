-- File: ~/.config/nvim/init.lua

-- ==========================================
-- Bootstrap Lazy.nvim if not installed
-- ==========================================
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)



-- ==========================================
-- Load your plugin specification
-- ==========================================

require("myconfig.core.options")
require("myconfig.core.keymaps")
require("myconfig.core.autocommands")
require("myconfig.plugins")  -- will call all plugin categories
require("myconfig.ui.theme")
require("myconfig.ui.statusline")
require("myconfig.utils")


require("overseer").setup({
  strategy = {
    "toggleterm",
    direction = "horizontal",
  },
})

-- Manually register the template from your path
require("overseer").register_template(require("myconfig.tasks.dotnet"))


local utils = require("myconfig.utils")

-- Reload a module
utils.reload("myconfig.plugins.git")

-- Join a path
print(utils.join_path(vim.fn.stdpath("config"), "lua", "myconfig"))

-- Use deferred function
utils.defer(function()
  print("Delayed execution!")
end, 1000)

