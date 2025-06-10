return {
  {
    "akinsho/flutter-tools.nvim",
    lazy = false,
    dependencies = {
      "dart-lang/dart-vim-plugin",
      "nvim-lua/plenary.nvim",
      "stevearc/dressing.nvim", -- optional
    },
    ft = "dart", -- Optional, but recommended to ensure it loads for Dart files
    config = true,
  },
}
