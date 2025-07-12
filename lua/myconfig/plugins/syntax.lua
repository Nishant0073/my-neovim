-- File: ~/.config/nvim/lua/myconfig/plugins/syntax.lua

return {
  -- 🌳 Treesitter: Syntax-aware highlighting, indentation, folding
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require("nvim-treesitter.configs").setup({
        -- Languages you want supported:
        ensure_installed = {
          "c", "cpp", "lua", "vim", "vimdoc", "bash", "markdown",
          "html", "css", "javascript", "typescript", "tsx", "json",
          "yaml", "toml", "python", "java", "c_sharp"
        },

        highlight = {
          enable = true,
          additional_vim_regex_highlighting = {
            "cshtml", "html", "markdown", "vim" -- Use regex fallback for cshtml
          },
        },

        indent = {
          enable = true,
        },

        auto_install = true, -- Automatically install missing parsers
      })
    end,
  },

  -- 🌈 Rainbow brackets — for C#, JS, etc.
  {
    "HiPhish/rainbow-delimiters.nvim",
    event = "VeryLazy",
    config = function()
      local rainbow_delimiters = require("rainbow-delimiters")
      vim.g.rainbow_delimiters = {
        strategy = {
          [""] = rainbow_delimiters.strategy["global"],
        },
        query = {
          [""] = "rainbow-delimiters",
        },
        highlight = {
          "RainbowDelimiterRed",
          "RainbowDelimiterYellow",
          "RainbowDelimiterBlue",
          "RainbowDelimiterOrange",
          "RainbowDelimiterGreen",
          "RainbowDelimiterViolet",
          "RainbowDelimiterCyan",
        },
      }
    end,
  },

  -- 🔖 Autotag (useful for .cshtml, .html, .jsx, etc.)
  {
    "windwp/nvim-ts-autotag",
    event = "InsertEnter",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    config = function()
      require("nvim-ts-autotag").setup({
        filetypes = { "html", "xml", "javascript", "typescriptreact", "cshtml" },
      })
    end,
  },

  -- 🔁 Autopairs — smart brackets for C#, JS, etc.
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
      require("nvim-autopairs").setup({
        check_ts = true,
      })
    end,
  },

  -- 🧼 Trailing whitespace cleaner (optional)
  {
    "ntpeters/vim-better-whitespace",
    event = "BufWritePre",
    config = function()
      vim.g.better_whitespace_enabled = 1
      vim.g.strip_whitespace_on_save = 1
      vim.g.strip_only_modified_lines = 1
    end,
  },
}


