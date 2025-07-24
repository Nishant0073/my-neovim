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
require("myconfig.lang.cpp")


require("overseer").setup({
    strategy = {
        "toggleterm",
        direction = "horizontal",
    },
})

-- Manually register the template from your path
require("overseer").register_template(require("myconfig.tasks.dotnet"))


local utils = require("myconfig.utils")

vim.g.nvim_tree_bindings = {
    { key = "d", cb = ":lua NvimTreeTrash()<CR>" },
}

-- Reload a module
utils.reload("myconfig.plugins.git")

-- Join a path
print(utils.join_path(vim.fn.stdpath("config"), "lua", "myconfig"))

-- Use deferred function
utils.defer(function()
    print("Delayed execution!")
end, 1000)

local function NvimTreeTrash()
	local lib = require('nvim-tree.lib')
	local node = lib.get_node_at_cursor()
	local trash_cmd = "trash "

	local function get_user_input_char()
		local c = vim.fn.getchar()
		return vim.fn.nr2char(c)
	end

	print("Trash " .. node.name .. " ? y/n")

	if node and get_user_input_char():match('^y') then
		vim.fn.jobstart(trash_cmd .. vim.fn.shellescape(node.absolute_path), {
			detach = true,
			on_exit = function() lib.refresh_tree() end,
		})
	end

	vim.cmd("normal! :esc<CR>")
end

-- Register custom action
local nvim_tree_api = require("nvim-tree.api")
nvim_tree_api.actions.define_action("custom_trash", NvimTreeTrash)
-- all files of linux type
vim.opt.fileformats = { "unix", "dos" }
