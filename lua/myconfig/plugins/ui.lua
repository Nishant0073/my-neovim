return {
    -- 🌙 Catppuccin Theme
    {
        "catppuccin/nvim",
        name = "catppuccin",         -- Required if not using short name
        priority = 1000,
        lazy = false,
        config = function()
            require("catppuccin").setup({
                flavour = "mocha",       -- latte, frappe, macchiato, mocha
                transparent_background = true, -- Optional
                integrations = {
                    nvimtree = true,
                    treesitter = true,
                    lsp_trouble = true,
                    lsp_saga = true,
                    cmp = true,
                    gitsigns = true,
                    telescope = true,
                    notify = true,
                    mini = true,
                    native_lsp = {
                        enabled = true,
                        underlines = {
                            errors = { "undercurl" },
                            hints = { "undercurl" },
                            warnings = { "undercurl" },
                            information = { "undercurl" },
                        },
                    },
                },
            })

            vim.cmd.colorscheme("catppuccin")
        end,
    },

    -- 🔵 UI Enhancements

    -- Statusline
    {
        "nvim-lualine/lualine.nvim",
        config = function()
            require("lualine").setup({
                options = {
                    theme = "catppuccin",
                    section_separators = "",
                    component_separators = "",
                },
            })
        end,
    },

    -- Buffer line (like tabs)
    {
        'romgrk/barbar.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        init = function() vim.g.barbar_auto_setup = false end,
        config = function()
            require('barbar').setup {
                animation = true,
                auto_hide = false,
                tabpages = true,
                clickable = true,
            }
        end,
    },

    -- Fancy notifications
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        dependencies = {
            "MunifTanjim/nui.nvim",
            "rcarriga/nvim-notify", -- optional, but highly recommended
        },
        opts = {
            -- Enable LSP message handling
            lsp = {
                progress = {
                    enabled = true,
                },
                override = {
                    ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                    ["vim.lsp.util.stylize_markdown"] = true,
                    ["cmp.entry.get_documentation"] = true,
                },
                signature = {
                    enabled = true,
                },
                hover = {
                    enabled = true,
                },
            },

            -- Presets (quick UI style options)
            presets = {
                bottom_search = true,      -- classic command-line at bottom
                command_palette = true,    -- position : and / together
                long_message_to_split = true,
                lsp_doc_border = true,     -- adds border to hover/signature
            },

            -- Routes for filtering noisy messages
            routes = {
                {
                    filter = {
                        event = "msg_show",
                        kind = "",
                        find = "written",
                    },
                    opts = { skip = true },
                },
            },

            -- You can also enable smart command line popup
            cmdline = {
                enabled = true,
                view = "cmdline_popup",
            },

            -- Notification style
            messages = {
                enabled = true,
                view = "mini",
                view_error = "notify",
                view_warn = "notify",
                view_history = "messages",
                view_search = "virtualtext",
            },
        },

    },
        {
            "nvim-pack/nvim-spectre",
            dependencies = { "nvim-lua/plenary.nvim" },
            keys = {
                { "<leader>rr", function() require("spectre").open() end, desc = "Replace in files (Spectre)" },
                { "<leader>rw", function() require("spectre").open_visual({select_word=true}) end, desc = "Replace current word (Spectre)" },
                { "<leader>rf", function() require("spectre").open_file_search() end, desc = "Replace in current file (Spectre)" },
            },
            config = true,
        }

}
