-- File: ~/.config/nvim/lua/myconfig/plugins/navigation.lua
-- Plugins: telescope.nvim (fuzzy finder), harpoon (file bookmarks), symbols-outline.nvim (LSP symbol tree)


return {
    -- 🔭 Telescope: Powerful fuzzy finder
    {
        "nvim-telescope/telescope.nvim",
        version = false,
        dependencies = {
            "nvim-lua/plenary.nvim", -- Required for telescope
            {
                "nvim-telescope/telescope-fzf-native.nvim",
                build = "make",
                cond = function()
                    return vim.fn.executable("make") == 1
                end,
            },
        },
        config = function()
            local telescope = require("telescope")
            telescope.setup({
                defaults = {
                    layout_strategy = "horizontal",
                    layout_config = {
                        prompt_position = "top",
                    },
                    sorting_strategy = "ascending",
                    winblend = 0,
                },
                pickers = {
                    buffers = {
                        previewer = false,
                    },
                },
            })

            -- Load fzf extension if available
            pcall(telescope.load_extension, "fzf")
        end,
    },


    -- 🧭 Symbols Outline: Code structure tree (classes, methods, props)
    {
        "simrat39/symbols-outline.nvim",
        cmd = "SymbolsOutline",
        config = function()
            require("symbols-outline").setup({
                highlight_hovered_item = true,
                show_guides = true,
                auto_preview = false,
                position = "right",
                width = 35,
                auto_close = false,
                show_numbers = false,
                show_relative_numbers = false,
                show_symbol_details = true,
                keymaps = {
                    close = { "<Esc>", "q" },
                    goto_location = "<CR>",
                    focus_location = "o",
                    hover_symbol = "K",
                },
            })
        end,
    },

    -- nvim-tree for file explorer

    {
        "nvim-tree/nvim-tree.lua",
        version = "*",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            local file_utils = require("myconfig.utils")

            require("nvim-tree").setup({

                sort = {
                    sorter = "case_sensitive",
                },
                view = {
                    width = 30,
                },
                renderer = {
                    group_empty = true,
                },
                filters = {
                    dotfiles = false,
                    git_ignored = false,
                },
                git = {
                    enable = true,
                },
                actions = {
                    open_file = {
                        quit_on_open = false,
                    },
                },
            })

            vim.api.nvim_create_autocmd("VimEnter", {
                callback = function(data)
                    local directory = vim.fn.isdirectory(data.file) == 1
                    if directory then
                        vim.cmd.cd(data.file)
                        require("nvim-tree.api").tree.open()
                    end
                end,
            })
        end,
    },

    -- touble.nvim: to list the errors

    {
        "folke/trouble.nvim",
        opts = {}, -- for default options, refer to the configuration section for custom setup.
        cmd = "Trouble",
        keys = {
            {
                "<leader>xx",
                "<cmd>Trouble diagnostics toggle<cr>",
                desc = "Diagnostics (Trouble)",
            },
            {
                "<leader>xX",
                "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
                desc = "Buffer Diagnostics (Trouble)",
            },
            {
                "<leader>cs",
                "<cmd>Trouble symbols toggle focus=false<cr>",
                desc = "Symbols (Trouble)",
            },
            {
                "<leader>cl",
                "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
                desc = "LSP Definitions / references / ... (Trouble)",
            },
            {
                "<leader>xL",
                "<cmd>Trouble loclist toggle<cr>",
                desc = "Location List (Trouble)",
            },
            {
                "<leader>xQ",
                "<cmd>Trouble qflist toggle<cr>",
                desc = "Quickfix List (Trouble)",
            },
        },
    },

    --  Which-Key: Smart popup for keybinding hints
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        config = function()
            require("which-key").setup()
        end,
    },


}

