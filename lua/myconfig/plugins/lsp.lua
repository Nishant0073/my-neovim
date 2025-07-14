-- File: lsp.lua – Configures LSP, mason, handlers for C#, CSHTML, etc.

return {
    -- 🔧 LSP manager (installs LSP servers)
    {
        "williamboman/mason.nvim",
        config = true,
    },

    -- 🔌 Mason + lspconfig bridge
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = { "neovim/nvim-lspconfig", "williamboman/mason.nvim" },
        config = function()
            require("mason").setup()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    -- "csharp-ls", -- C#
                    -- "razor_ls",        -- Razor/CSHTML
                    "clangd",          -- C++
                    "pyright",         -- Python
                    "jdtls",           -- Java
                },
                automatic_installation = true,
            })
        end,
    },

    -- ⚙️ Core LSP configurations
    {
        "neovim/nvim-lspconfig",
        config = function()
            local lspconfig = require("lspconfig")

            -- Shared capabilities (completion)
            local capabilities = require("cmp_nvim_lsp").default_capabilities()

            -- Default handler
            local on_attach = function(_, bufnr)
                local keymap = vim.keymap.set
                local opts = { buffer = bufnr, noremap = true, silent = true }

                keymap("n", "gd", vim.lsp.buf.definition, opts)
                keymap("n", "K", vim.lsp.buf.hover, opts)
                keymap("n", "gi", vim.lsp.buf.implementation, opts)
                keymap("n", "<leader>rn", vim.lsp.buf.rename, opts)
                keymap("n", "<leader>ca", vim.lsp.buf.code_action, opts)
                keymap("n", "gr", vim.lsp.buf.references, opts)
                keymap("n", "<leader>ld", vim.diagnostic.open_float, opts)
            end

            -- 🟣 C# + CSHTML via clang-ls
            local pid = vim.fn.getpid()
            local lspconfig = require("lspconfig")

            lspconfig.csharp_ls.setup({
                cmd = { "csharp-ls" },
                filetypes = { "cs" },
                root_dir = lspconfig.util.root_pattern("*.sln", "*.csproj"),
                init_options = { AutomaticWorkspaceInit = true },
            })

            -- 🐍 Python
            lspconfig.pyright.setup({
                capabilities = capabilities,
                on_attach = on_attach,
            })

            -- ☕ Java
            lspconfig.jdtls.setup({
                capabilities = capabilities,
                on_attach = on_attach,
            })
        end,
    },

    -- 💡 (Optional) VS Code-style lightbulb for code actions
    {
        "kosayoda/nvim-lightbulb",
        event = "LspAttach",
        opts = {
            autocmd = { enabled = true },
        },
    },
}

