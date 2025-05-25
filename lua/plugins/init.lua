-- ~/.config/nvim/init.lua

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    lazypath
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  -- github copilot 
  "github/copilot.vim",
    
  -- Autocompletion
  "hrsh7th/nvim-cmp",
  "hrsh7th/cmp-nvim-lsp",
  "hrsh7th/cmp-buffer",
  "hrsh7th/cmp-path",
  "hrsh7th/cmp-cmdline",
  "saadparwaiz1/cmp_luasnip",

  -- Snippets
  "L3MON4D3/LuaSnip",
  "rafamadriz/friendly-snippets",

  -- LSP
  "neovim/nvim-lspconfig",

  -- Treesitter
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },

  -- Telescope
  { "nvim-telescope/telescope.nvim", tag = "0.1.5", dependencies = { "nvim-lua/plenary.nvim" } },

  -- File explorer
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("nvim-tree").setup({})
    end,
  },

  -- Autopairs
  {
    "windwp/nvim-autopairs",
    config = function()
      require("nvim-autopairs").setup({})
    end,
  },

  -- Theme: angelic.nvim
  {
    "sponkurtus2/angelic.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("angelic").setup({ transparent = false })
      vim.cmd.colorscheme("angelic")
    end,
  },
    
    -- Status line
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons", opt = true },
        config = function()
        require("lualine").setup({
            options = {
            theme = "gruvbox",
            section_separators = "",
            component_separators = "",
            },
        })
        end,
    },


    -- Terminal integration
    {
        "akinsho/toggleterm.nvim",
        version = "*",
        config = function()
            require("toggleterm").setup({
                size = 20,
                open_mapping = [[<c-\>]],
                hide_numbers = true,
                shade_filetypes = {},
                shade_terminals = true,
                shading_factor = 2,
                start_in_insert = true,
                persist_size = true,
            })
        end,
    },

    -- Markdown preview
    {
        "iamcco/markdown-preview.nvim",
        build = "cd app && npm install",
        ft = { "markdown" },
        config = function()
            vim.g.mkdp_auto_start = 1
            vim.g.mkdp_auto_close = 0
            vim.g.mkdp_browser = "brave"
            vim.g.mkdp_preview_options = {
                sync_scroll_type = "middle",
            }
        end,
    },

    -- Debugging
    {
        "mfussenegger/nvim-dap",
        dependencies = {
            "nvim-neotest/nvim-nio",
            "rcarriga/nvim-dap-ui",
            "theHamsta/nvim-dap-virtual-text",
        },
        config = function()
            require("dapui").setup()
            require("nvim-dap-virtual-text").setup()
            -- Additional DAP configuration can go here
        end,
    },


    -- Git signs
    {
        "lewis6991/gitsigns.nvim",
        config = function()
            require("gitsigns").setup({
                signs = {
                    add = { text = "│" },
                    change = { text = "│" },
                    delete = { text = "─" },
                    topdelete = { text = "─" },
                    changedelete = { text = "~" },
                },
                numhl = false,
                linehl = false,
                word_diff = false,
            })
        end,
    },

    -- Commenting
    {
        "numToStr/Comment.nvim",
        config = function()
            require("Comment").setup({
                mappings = {
                    basic = true,
                    extra = true,
                    extended = false,
                },
            })
        end,
    },

    -- File icons
    {
        "nvim-tree/nvim-web-devicons",
        config = function()
            require("nvim-web-devicons").setup({
                default = true,
            })
        end,
    },

    -- Dressing for UI elements
    {
        "stevearc/dressing.nvim",
        config = function()
            require("dressing").setup({
                input = { enabled = true },
                select = {
                    backend = { "telescope", "builtin" },
                    telescope = { theme = "dropdown" },
                },
            })
        end,
    },


    -- Additional plugins can be added here
    
})

-- Basic settings
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.termguicolors = true
vim.opt.cursorline = true
vim.opt.wrap = false
vim.opt.scrolloff = 5
vim.opt.signcolumn = "yes"

-- Keymaps
vim.g.mapleader = ","
vim.keymap.set("n", "<leader>w", ":w<CR>", { desc = "Save file" })
vim.keymap.set("n", "<leader>q", ":q<CR>", { desc = "Quit file" })

-- Safe loading of optional configs
local function safe_require(name)
  local ok, err = pcall(require, name)
  if not ok then
    vim.notify("Failed to load: " .. name .. "\n" .. err, vim.log.levels.WARN)
  end
end

safe_require("plugins.theme")
safe_require("plugins.lsp")
safe_require("plugins.cmp")
safe_require("plugins.treesitter")

