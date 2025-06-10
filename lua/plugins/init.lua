-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Collect plugin modules from lua/plugins/*.lua
local plugin_files = vim.fn.glob(vim.fn.stdpath("config") .. "/lua/plugins/*.lua", false, true)

local plugins = {
  -- Static plugins here if needed
  -- "github/copilot.vim",
  -- "lukas-reineke/indent-blankline.nvim",
}

-- Load each plugin module
for _, file in ipairs(plugin_files) do
  local module = file:match("lua/(.*)%.lua$"):gsub("/", ".")
  if module ~= "plugins.init" then -- Skip self to avoid recursion
    local ok, plugin = pcall(require, module)
    if ok then
      if type(plugin) == "table" then
        -- Handle multiple plugins returned as list
        if type(plugin[1]) == "table" then
          for _, p in ipairs(plugin) do
            table.insert(plugins, p)
          end
        else
          table.insert(plugins, plugin)
        end
      end
    else
      vim.notify("Failed to load plugin module: " .. module .. "\n" .. plugin, vim.log.levels.WARN)
    end
  end
end

-- Setup lazy.nvim with collected plugin specs
require("lazy").setup(plugins)

-- Safe require utility for config files
local function safe_require(name)
  local ok, err = pcall(require, name)
  if not ok then
    vim.notify("Failed to load: " .. name .. "\n" .. err, vim.log.levels.WARN)
  end
end

-- Load core configuration
safe_require("core.options")   -- core/options.lua
safe_require("core.keymaps")   -- core/keymaps.lua

-- Load additional plugin configs safely
safe_require("plugins.flutter")  -- plugins/flutter.lua

