return {
  "Aasim-A/scrollEOF.nvim",
  event = { "CursorMoved", "WinScrolled" },
  opts = {
    insert_mode = true,
    disabled_filetypes = {
      "snacks_terminal", -- Fix flickering in LazyGit and terminals
    },
  },
}
