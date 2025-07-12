-- File: ~/.config/nvim/lua/myconfig/plugins/linting.lua

return {
  -- 🧼 Formatter: conform.nvim (modern, fast, async)
  {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    config = function()
      require("conform").setup({
        formatters_by_ft = {
          lua = { "stylua" },
          javascript = { "prettier" },
          typescript = { "prettier" },
          html = { "prettier" },
          css = { "prettier" },
          json = { "prettier" },
          markdown = { "prettier" },
          c_sharp = { "dotnet_format" }, -- requires dotnet-format installed
        },
        format_on_save = {
          timeout_ms = 500,
          lsp_fallback = true,
        },
      })
    end,
  },

  -- 🔍 Linter: nvim-lint (for code diagnostics)
  {
    "mfussenegger/nvim-lint",
    event = { "BufReadPost", "BufWritePost", "InsertLeave" },
    config = function()
      require("lint").linters_by_ft = {
        javascript = { "eslint_d" },
        typescript = { "eslint_d" },
        html = { "tidy" },
        json = { "jsonlint" },
        lua = { "luacheck" },
        c_sharp = { "csharpier" }, -- optional: use custom wrapper for roslyn analyzers
      }

      -- Auto lint on save
      vim.api.nvim_create_autocmd({ "BufWritePost", "InsertLeave" }, {
        callback = function()
          require("lint").try_lint()
        end,
      })
    end,
  },
}

