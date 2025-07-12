require("lazy").setup({
  -- Load plugin modules by importing each category
  { import = "myconfig.plugins.ui" },
  { import = "myconfig.plugins.lsp" },
  { import = "myconfig.plugins.completion" },
  { import = "myconfig.plugins.git" },
  { import = "myconfig.plugins.debugger" },
  { import = "myconfig.plugins.syntax" },
  { import = "myconfig.plugins.navigation" },
  { import = "myconfig.plugins.terminal" },
  { import = "myconfig.plugins.linting" },
  { import = "myconfig.plugins.testing" },
  { import = "myconfig.plugins.project" },
  { import = "myconfig.plugins.compiler" },

  -- Optional: You can register standalone plugins here too
  -- {
  --   "nvim-lua/plenary.nvim"
  -- },
})

require("overseer").register_template(require("myconfig.tasks.dotnet"))

