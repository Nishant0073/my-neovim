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

-- Collect all plugin modules in lua/plugins/*.lua
local plugin_files = vim.fn.globpath(vim.fn.stdpath("config") .. "/lua/plugins", "*.lua", false, true)

local plugins = {
  -- Add plugins that are not modularized
  -- "github/copilot.vim",
}

-- Load each plugin module
for _, file in ipairs(plugin_files) do
  local module = file:match("lua/(.*)%.lua$"):gsub("/", ".")
  if module ~= "plugins.init" then -- Prevent recursive loading
    local ok, plugin = pcall(require, module)
    if ok then
      if type(plugin) == "table" then
        -- Handle if file returns multiple plugins
        if plugin[1] ~= nil and type(plugin[1]) == "table" then
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

-- Optional: Safe-require other config files (non-plugin modules like core/keymaps)
local function safe_require(name)
  local ok, err = pcall(require, name)
  if not ok then
    vim.notify("Failed to load: " .. name .. "\n" .. err, vim.log.levels.WARN)
  end
end

safe_require("core.options")     -- if you have core/options.lua
safe_require("core.keymaps")     -- if you have core/keymaps.lua

