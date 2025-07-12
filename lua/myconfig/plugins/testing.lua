-- File: testing.lua – sets up neotest with adapters

return {
  -- 🔬 Neotest core
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "antoinemadec/FixCursorHold.nvim", -- fix UI delay
      -- Language-specific adapters
      "nvim-neotest/neotest-python",     -- 🐍 Python
      -- Add more adapters as needed here
    },
    config = function()
      local neotest = require("neotest")

      neotest.setup({
        adapters = {
          require("neotest-python")({
            dap = { justMyCode = false },
          }),
          -- Add more like C# later if dotnet integration is bridged
        },
        -- General settings
        output = {
          open_on_run = true,
        },
        quickfix = {
          enabled = true,
          open = true,
        },
      })
    end,
  },
}

