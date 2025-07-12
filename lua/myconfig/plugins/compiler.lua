-- File: ~/.config/nvim/lua/myconfig/plugins/compiler.lua

return {
  -- 👷 Task runner for build systems (dotnet, make, etc.)
  {
    "stevearc/overseer.nvim",
    dependencies = { "akinsho/toggleterm.nvim" },
    opts = {
      strategy = {
        "toggleterm",
        direction = "horizontal",
      },
      templates = { "builtin", "user.dotnet" }, -- Add custom dotnet template
    },
  },
}

