-- File: ~/.config/nvim/lua/myconfig/plugins/terminal.lua

return {
  -- 🖥️ ToggleTerm: Integrated terminal
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
      require("toggleterm").setup({
        size = 15,
        open_mapping = [[<C-\>]],
        hide_numbers = true,
        shade_filetypes = {},
        shade_terminals = true,
        shading_factor = 2,
        start_in_insert = true,
        insert_mappings = true,
        persist_size = true,
        direction = "float", -- "horizontal" | "vertical" | "float"
        float_opts = {
          border = "curved",
        },
      })

      -- Optional keymaps (or move to keymaps.lua)
      local Terminal = require("toggleterm.terminal").Terminal
      local lazygit = Terminal:new({ cmd = "lazygit", hidden = true })

      vim.keymap.set("n", "<leader>gg", function()
        lazygit:toggle()
      end, { desc = "Toggle LazyGit (terminal)" })

      vim.keymap.set("n", "<leader>tt", "<cmd>ToggleTerm<CR>", { desc = "Toggle Terminal" })
    end,
  },

  -- ⚙️ Overseer: Build/test/task runner
  {
    "stevearc/overseer.nvim",
    opts = {
      strategy = {
        "toggleterm",
        direction = "horizontal",
      },
      templates = { "builtin", "user.dotnet" }, -- Add custom dotnet template
    },
    config = function()
      require("overseer").setup({
        templates = { "builtin", "user.dotnet" }, -- we can create dotnet tasks later
      })

      vim.keymap.set("n", "<leader>or", "<cmd>OverseerRun<CR>", { desc = "Overseer Run Task" })
      vim.keymap.set("n", "<leader>ot", "<cmd>OverseerToggle<CR>", { desc = "Overseer Toggle UI" })
    end,
  },
}

