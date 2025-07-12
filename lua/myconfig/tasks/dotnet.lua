-- File: ~/.config/nvim/lua/myconfig/tasks/dotnet.lua

return {
  name = "Dotnet Build",
  builder = function()
    return {
      cmd = { "dotnet" },
      args = { "build" },
      name = "dotnet build",
      cwd = vim.fn.getcwd(),
      components = {
        "default",
        "on_output_quickfix",
        "on_result_diagnostics",
      },
    }
  end,
  condition = {
    filetype = { "cs", "cshtml" },
    callback = function()
      return vim.fn.filereadable("*.csproj") == 1
    end,
  },
}

