-- File: debugger.lua – Setup DAP + UI + virtual text

return {
  -- 🐞 Core DAP plugin
  {
    "mfussenegger/nvim-dap",
    config = function()
      local dap = require("dap")

      -- 🔹 C# (coreclr)
      dap.adapters.coreclr = {
        type = 'executable',
        command = '/path/to/netcoredbg', -- change this to actual path
        args = { '--interpreter=vscode' }
      }

      dap.configurations.cs = {
        {
          type = "coreclr",
          name = "Launch - NetCoreDbg",
          request = "launch",
          program = function()
            return vim.fn.input('Path to DLL: ', vim.fn.getcwd() .. '/bin/Debug/', 'file')
          end,
        },
      }

      -- 🔹 Python
      dap.adapters.python = {
        type = 'executable',
        command = 'python',
        args = { '-m', 'debugpy.adapter' },
      }

      dap.configurations.python = {
        {
          type = 'python',
          request = 'launch',
          name = 'Launch file',
          program = '${file}',
          pythonPath = function()
            return 'python'
          end,
        },
      }

      -- 🔹 C++ (lldb)
      dap.adapters.lldb = {
        type = 'executable',
        command = '/usr/bin/lldb-vscode', -- or lldb
        name = 'lldb'
      }

      dap.configurations.cpp = {
        {
          name = "Launch C++ file",
          type = "lldb",
          request = "launch",
          program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
          end,
          cwd = '${workspaceFolder}',
          stopOnEntry = false,
          args = {},
        },
      }

      -- Reuse cpp config for c
      dap.configurations.c = dap.configurations.cpp
    end,
  },

  -- 🖥️ DAP UI
  {
    "rcarriga/nvim-dap-ui",
    dependencies = { "mfussenegger/nvim-dap",  "nvim-neotest/nvim-nio", },
    config = function()
      local dap, dapui = require("dap"), require("dapui")

      dapui.setup()

      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end

      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end

      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end
    end,
  },

  -- 🧠 Virtual Text: show values inline
  {
    "theHamsta/nvim-dap-virtual-text",
    dependencies = { "mfussenegger/nvim-dap" },
    opts = {},
  },

  -- 📦 Optional: Install debuggers using Mason
  {
    "jay-babu/mason-nvim-dap.nvim",
    dependencies = { "williamboman/mason.nvim", "mfussenegger/nvim-dap" },
    config = function()
      require("mason-nvim-dap").setup({
        ensure_installed = {
          "coreclr", -- C#
          "python",  -- Python
          "cppdbg",  -- C++
        },
        automatic_installation = true,
      })
    end,
  },
}

