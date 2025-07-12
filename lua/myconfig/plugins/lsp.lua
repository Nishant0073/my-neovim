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
        dependencies = { "neovim/nvim-lspconfig", "williamboman/mason.nvim" ,"Hoffs/omnisharp-extended-lsp.nvim"},
        config = function()
            require("mason").setup()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "omnisharp",       -- C#
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

            -- 🟣 C# + CSHTML via omnisharp
            local pid = vim.fn.getpid()
            local lspconfig = require("lspconfig")
            local omnisharp_ext = require("omnisharp_extended")

            lspconfig.omnisharp.setup({
                cmd = {
                    "dotnet",
                    vim.fn.expand("~/.local/share/nvim/mason/packages/omnisharp/OmniSharp.dll"),
                },
                enable_import_completion = true,
                enable_roslyn_analyzers = true,
                organize_imports_on_format = true,
                handlers = {
                    ["textDocument/definition"] = omnisharp_ext.handler,
                },
                capabilities = require("cmp_nvim_lsp").default_capabilities(),
            })
            -- lspconfig.omnisharp.setup({
            --   capabilities = capabilities,
            --   on_attach = on_attach,
            --   -- cmd = { "dotnet", "/usr/lib/omnisharp-roslyn/OmniSharp"  }, -- make sure it's in PATH or install via mason
            --   cmd = { "dotnet", vim.fn.expand("~/.local/share/nvim/mason/packages/omnisharp/OmniSharp.dll") },
            --
            --   enable_editorconfig_support = true,
            --   enable_roslyn_analyzers = true,
            --   organize_imports_on_format = true,
            --   enable_import_completion = true,
            -- })
            --
            -- -- 🌐 Razor (CSHTML)
            -- lspconfig.razor_ls.setup({
            --   capabilities = capabilities,
            --   on_attach = on_attach,
            -- })

            -- ⚙️ C++
            lspconfig.clangd.setup({
                capabilities = capabilities,
                on_attach = on_attach,
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

