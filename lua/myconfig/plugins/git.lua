-- File: ~/.config/nvim/lua/myconfig/plugins/git.lua

return {
  -- 🧠 Inline git signs (gutter indicators)
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("gitsigns").setup({
        signs = {
          add = { text = "│" },
          change = { text = "│" },
          delete = { text = "_" },
          topdelete = { text = "‾" },
          changedelete = { text = "~" },
        },
        current_line_blame = true,
        on_attach = function(bufnr)
          local gs = package.loaded.gitsigns
          local keymap = vim.keymap.set

          -- Keybindings
          keymap("n", "<leader>gs", gs.stage_hunk, { buffer = bufnr, desc = "Stage Hunk" })
          keymap("n", "<leader>gr", gs.reset_hunk, { buffer = bufnr, desc = "Reset Hunk" })
          keymap("n", "<leader>gp", gs.preview_hunk, { buffer = bufnr, desc = "Preview Hunk" })
          keymap("n", "<leader>gb", function() gs.blame_line({ full = true }) end, { buffer = bufnr, desc = "Git Blame" })
          keymap("n", "]c", gs.next_hunk, { buffer = bufnr, desc = "Next Hunk" })
          keymap("n", "[c", gs.prev_hunk, { buffer = bufnr, desc = "Prev Hunk" })
        end,
      })
    end,
  },

  -- 🔧 Full Git UI
  {
    "NeogitOrg/neogit",
    dependencies = { "nvim-lua/plenary.nvim" },
    cmd = "Neogit",
    config = function()
      require("neogit").setup({
        integrations = {
          diffview = true,
        },
      })
    end,
  },

  -- 📊 Diff view for Git
  {
    "sindrets/diffview.nvim",
    cmd = { "DiffviewOpen", "DiffviewFileHistory" },
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("diffview").setup()
    end,
  },
}

