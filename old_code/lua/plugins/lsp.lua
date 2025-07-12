return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      { "williamboman/mason.nvim", config = true },
      "williamboman/mason-lspconfig.nvim",
      "whoissethdaniel/mason-tool-installer.nvim",
      {
        "j-hui/fidget.nvim",
        opts = {},
      },
      {
        "folke/neodev.nvim",
        opts = {},
      },
      {
        "tris203/rzls.nvim",
        lazy = true,
        config = true,
      },
    },

    config = function()
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

      -- LSP Attach Setup
      vim.api.nvim_create_autocmd("lspattach", {
        group = vim.api.nvim_create_augroup("user-lsp-attach", { clear = true }),
        callback = function(event)
          local map = function(keys, func, desc)
            vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "lsp: " .. desc })
          end

          map("gd", require("telescope.builtin").lsp_definitions, "[g]oto [d]efinition")
          map("gr", require("telescope.builtin").lsp_references, "[g]oto [r]eferences")
          map("gi", require("telescope.builtin").lsp_implementations, "[g]oto [i]mplementation")
          map("<leader>d", require("telescope.builtin").lsp_type_definitions, "type [d]efinition")
          map("<leader>ds", require("telescope.builtin").lsp_document_symbols, "[d]ocument [s]ymbols")
          map("<leader>ws", require("telescope.builtin").lsp_dynamic_workspace_symbols, "[w]orkspace [s]ymbols")
          map("<leader>rr", vim.lsp.buf.rename, "[r]ename")
          map("<leader>ca", vim.lsp.buf.code_action, "[c]ode [a]ction")
          map("K", vim.lsp.buf.hover, "hover documentation")

          local client = vim.lsp.get_client_by_id(event.data.client_id)
          if client and client.server_capabilities.documentHighlightProvider then
            local group = vim.api.nvim_create_augroup("lsp-highlight", { clear = false })
            vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
              group = group,
              buffer = event.buf,
              callback = vim.lsp.buf.document_highlight,
            })
            vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
              group = group,
              buffer = event.buf,
              callback = vim.lsp.buf.clear_references,
            })
          end
        end,
      })

      -- Setup Mason
      require("mason").setup()
      require("mason-lspconfig").setup()

    end,
  },
}

