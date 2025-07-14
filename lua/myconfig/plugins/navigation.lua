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

    -- 📁 neo-tree: File explorer (replacement for nvim-tree)
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim",
        },
        config = function()
            require("neo-tree").setup({
                close_if_last_window = true,
                popup_border_style = "rounded",
                enable_git_status = true,
                enable_diagnostics = false,

                default_component_configs = {
                    indent = {
                        padding = 1,
                    },
                    icon = {
                        folder_closed = "",
                        folder_open = "",
                        folder_empty = "",
                    },
                    git_status = {
                        symbols = {
                            added = "✚",
                            modified = "",
                            deleted = "✖",
                            renamed = "➜",
                            untracked = "★",
                            ignored = "◌",
                            unstaged = "✗",
                            staged = "✓",
                            conflict = "",
                        },
                    },
                },

                filesystem = {
                    filtered_items = {
                        visible = true,
                        hide_dotfiles = false,
                        hide_gitignored = false,
                    },
                    follow_current_file = {
                        enabled = true,
                    },
                    hijack_netrw_behavior = "open_default",
                    use_libuv_file_watcher = true,
                    window = {
                        width = 30,
                        position = "left",
                        mappings = {
                            ["<space>"] = "none",
                            ["d"] = "delete",
                            ["r"] = "rename",
                            ["a"] = "add",
                            ["x"] = "cut",
                            ["c"] = "copy",
                            ["p"] = "paste",
                            ["<CR>"] = "open",
                            ["o"] = "system_open",
                        },
                    },
                    commands = {
                        delete = function(state)
                            local path = state.tree:get_node().path
                            vim.fn.system({ "gio", "trash", path })
                            require("neo-tree.sources.manager").refresh("filesystem")
                        end,
                    },
                },
            })

            -- 🏁 Auto open neo-tree when `nvim .` is run
            vim.api.nvim_create_autocmd("VimEnter", {
                callback = function(data)
                    local dir = vim.fn.isdirectory(data.file) == 1
                    if not dir then return end
                    vim.cmd.cd(data.file)
                    require("neo-tree.command").execute({ action = "show", source = "filesystem" })
                end,
            })
        end,
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

