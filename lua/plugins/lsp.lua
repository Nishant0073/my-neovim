return {
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")
      local util = vim.lsp.util

      -- Diagnostic signs (Nerd Fonts)
      local signs = {
        Error = "",
        Warn  = "",
        Hint  = "",
        Info  = "",
      }

      for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
      end

      -- -- Override jump_to_location safely
      -- vim.lsp.util.jump_to_location = function(location, encoding, reuse_win)
      --   if not location then return end
      --
      --   local bufnr = vim.uri_to_bufnr(location.uri)
      --   vim.fn.bufload(bufnr)
      --
      --   local range = location.range or location.targetSelectionRange
      --   local start_line = range.start.line
      --   local start_char = range.start.character
      --
      --   local line_count = vim.api.nvim_buf_line_count(bufnr)
      --   if start_line >= line_count then
      --     vim.notify("LSP returned cursor line outside buffer: " .. start_line, vim.log.levels.WARN)
      --     return
      --   end
      --
      --   -- Open the location
      --   util.jump_to_location(location, encoding or "utf-8", reuse_win)
      -- end
      --
      -- -- Override textDocument/definition handler with safe jump
      -- vim.lsp.handlers["textDocument/definition"] = function(err, result, ctx, config)
      --   if err then
      --     vim.notify("LSP definition error: " .. err.message, vim.log.levels.ERROR)
      --     return
      --   end
      --   if not result or vim.tbl_isempty(result) then
      --     vim.notify("No definition found", vim.log.levels.WARN)
      --     return
      --   end
      --
      --   local location = result[1] or result
      --   vim.lsp.util.jump_to_location(location, "utf-8", true)
      -- end
      --
      -- -- Hover handler with delayed popup (1 second)
      -- local timer = vim.loop.new_timer()
      -- local hover_ns = vim.api.nvim_create_namespace("lsp_hover_ns")
      --
      -- -- Clear previous hover when cursor moves
      -- vim.api.nvim_create_autocmd({"CursorMoved", "CursorMovedI"}, {
      --   callback = function()
      --     timer:stop()
      --     vim.api.nvim_buf_clear_namespace(0, hover_ns, 0, -1)
      --   end,
      -- })
      --
      -- vim.api.nvim_create_autocmd({"CursorHold", "CursorHoldI"}, {
      --   callback = function()
      --     -- Request hover info
      --     local params = vim.lsp.util.make_position_params()
      --     vim.lsp.buf_request(0, "textDocument/hover", params, function(err, result)
      --       if err or not result or not result.contents then return end
      --
      --       local markdown_lines = vim.lsp.util.convert_input_to_markdown_lines(result.contents)
      --       markdown_lines = vim.lsp.util.trim_empty_lines(markdown_lines)
      --       if vim.tbl_isempty(markdown_lines) then return end
      --
      --       -- Show hover window with rounded border
      --       util.open_floating_preview(markdown_lines, "markdown", { border = "rounded" })
      --     end)
      --   end,
      -- })
      --
      -- Setup C LSP
      lspconfig.clangd.setup {}

      -- Setup Omnisharp for C#
      lspconfig.omnisharp.setup {
        cmd = {
          "/usr/bin/omnisharp",
          "--languageserver",
          "--hostPID", tostring(vim.fn.getpid()),
          "--sdk", "/usr/bin/dotnet"
        },
        enable_roslyn_analyzers = true,
        organize_imports_on_format = true,
        enable_import_completion = true,
      }

      -- Diagnostics UI config
      vim.diagnostic.config({
        virtual_text = true,
        signs = true,
        update_in_insert = false,
      })
    end
  }
}

