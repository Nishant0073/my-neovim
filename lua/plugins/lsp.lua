return {
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")

      -- Better diagnostic icons (Nerd Fonts recommended)
      local signs = {
        Error = "",      --  heavy cross
        Warn  = "",      --  warning
        Hint  = "",      --  lightbulb
        Info  = "",      --  info
      }

      for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
      end

      -- Setup language servers

      -- C
      lspconfig.clangd.setup {}

      -- C#
      lspconfig.omnisharp.setup {
        cmd = {
    "/usr/bin/omnisharp",  -- Path to omnisharp executable
    "--languageserver",
    "--hostPID", tostring(vim.fn.getpid()),
    "--sdk", "/usr/bin/dotnet"  -- full path to dotnet executable (optional)
  },
        enable_roslyn_analyzers = true,
        organize_imports_on_format = true,
        enable_import_completion = true,
      }

      -- Diagnostics config
      vim.diagnostic.config({
        virtual_text = true,
        signs = true,
        update_in_insert = false,
      })
    end,
  }
}

