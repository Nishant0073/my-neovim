return {
  -- 🌙 Catppuccin Theme
  {
    "catppuccin/nvim",
    name = "catppuccin",         -- Required if not using short name
    priority = 1000,
    lazy = false,
    config = function()
      require("catppuccin").setup({
        flavour = "mocha",       -- latte, frappe, macchiato, mocha
        transparent_background = true, -- Optional
        integrations = {
          nvimtree = true,
          treesitter = true,
          lsp_trouble = true,
          lsp_saga = true,
          cmp = true,
          gitsigns = true,
          telescope = true,
          notify = true,
          mini = true,
          native_lsp = {
            enabled = true,
            underlines = {
              errors = { "undercurl" },
              hints = { "undercurl" },
              warnings = { "undercurl" },
              information = { "undercurl" },
            },
          },
        },
      })

      vim.cmd.colorscheme("catppuccin")
    end,
  },

  -- 🔵 UI Enhancements

  -- Statusline
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("lualine").setup({
        options = {
          theme = "catppuccin",
          section_separators = "",
          component_separators = "",
        },
      })
    end,
  },

  -- Buffer line (like tabs)
  {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("bufferline").setup({
        options = {
          mode = "buffers",
          diagnostics = "nvim_lsp",
          separator_style = "slant",
        },
      })
    end,
  },

  -- File tree with icons
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("nvim-tree").setup()
    end,
  },

  -- Fancy notifications
  {
    "rcarriga/nvim-notify",
    config = function()
      vim.notify = require("notify")
    end,
  },
}

