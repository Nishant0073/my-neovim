return {
  {
    "seblyng/roslyn.nvim",
    ft = { "cs", "razor","cshtml"},
    dependencies = {
      {
        -- By loading as a dependencies, we ensure that we are available to set
        -- the handlers for Roslyn.
        "tris203/rzls.nvim",
        config = true,
      },
    },
    config = function()
      -- Use one of the methods in the Integration section to compose the command.
      -- -- Adjust these paths to where you installed Roslyn and rzls.
      local roslyn_base_path = vim.fs.joinpath(vim.fn.stdpath("data"), "roslyn")
      -- local rzls_base_path = vim.fs.joinpath(vim.fn.stdpath("/home/nishant/Apps/razor-tooling/artifacts/LanguageServer/Debug/net9.0/linux-x64/"), "rzls")
      local rzls_base_path = "/home/nishant/Apps/razor-tooling/artifacts/LanguageServer/Debug/net9.0/linux-x64/rzls"


      local cmd = {
        "dotnet",
        vim.fs.joinpath(roslyn_base_path, "Microsoft.CodeAnalysis.LanguageServer.dll"),
        "--stdio",
        "--logLevel=Information",
        "--extensionLogDirectory=" .. vim.fs.dirname(vim.lsp.get_log_path()),
        "--razorSourceGenerator=" .. vim.fs.joinpath(rzls_base_path, "Microsoft.CodeAnalysis.Razor.Compiler.dll"),
        "--razorDesignTimePath="
          .. vim.fs.joinpath(rzls_base_path, "Targets", "Microsoft.NET.Sdk.Razor.DesignTime.targets"),
      }

      vim.lsp.config("roslyn", {
        cmd = cmd,
        handlers = require("rzls.roslyn_handlers"),
        settings = {
          ["csharp|inlay_hints"] = {
            csharp_enable_inlay_hints_for_implicit_object_creation = true,
            csharp_enable_inlay_hints_for_implicit_variable_types = true,

            csharp_enable_inlay_hints_for_lambda_parameter_types = true,
            csharp_enable_inlay_hints_for_types = true,
            dotnet_enable_inlay_hints_for_indexer_parameters = true,
            dotnet_enable_inlay_hints_for_literal_parameters = true,
            dotnet_enable_inlay_hints_for_object_creation_parameters = true,
            dotnet_enable_inlay_hints_for_other_parameters = true,
            dotnet_enable_inlay_hints_for_parameters = true,
            dotnet_suppress_inlay_hints_for_parameters_that_differ_only_by_suffix = true,
            dotnet_suppress_inlay_hints_for_parameters_that_match_argument_name = true,
            dotnet_suppress_inlay_hints_for_parameters_that_match_method_intent = true,
          },
          ["csharp|code_lens"] = {
            dotnet_enable_references_code_lens = true,
          },
        },
      })
      vim.lsp.enable("roslyn")
    end,
    init = function()
      -- We add the Razor file types before the plugin loads.
      vim.filetype.add({
        extension = {
          razor = "razor",
          cshtml = "razor",
        },
      })
    end,
  },
}
