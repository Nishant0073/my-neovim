return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate", -- optional but recommended
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = { "c", "lua", "cpp", "c_sharp" },
        highlight = { enable = true },
        indent = { enable = true },
      })
    end,
  }
}

