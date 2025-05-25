local lspconfig = require("lspconfig")

-- C
lspconfig.clangd.setup {}

-- C#
lspconfig.omnisharp.setup {
  cmd = { "/usr/bin/omnisharp" }, -- ensure it's in PATH
  enable_roslyn_analyzers = true,
  organize_imports_on_format = true,
  enable_import_completion = true,
}

-- Diagnostics
vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  update_in_insert = false,
})

