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

    -- 📁 nvim-tree: File explorer
{
  "nvim-tree/nvim-tree.lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  lazy = false, -- load at startup
  priority = 1000,
  config = function()
    -- 🔌 Disable netrw
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    -- 📁 Setup nvim-tree
    require("nvim-tree").setup({
      sort_by = "case_sensitive",
      view = {
        width = 30,
        side = "left",
        preserve_window_proportions = true,
      },
      renderer = {
        group_empty = true,
        highlight_git = true,
        icons = {
          show = {
            git = true,
            folder = true,
            file = true,
            folder_arrow = true,
          },
        },
      },
      filters = {
        dotfiles = false,
        git_ignored = false,
      },
      git = {
        enable = true,
        ignore = false,
      },
      update_focused_file = {
        enable = true,
        update_root = true,
      },
    })

    -- 📂 Auto-open tree on `nvim .` or dir
    local function open_nvim_tree(data)
      local directory = vim.fn.isdirectory(data.file) == 1
      if not directory then return end

      vim.cmd.cd(data.file)
      require("nvim-tree.api").tree.open()
    end

    vim.api.nvim_create_autocmd("VimEnter", {
      callback = open_nvim_tree,
    })
  end,
},


    -- 🧠 Which-Key: Smart popup for keybinding hints
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        config = function()
            require("which-key").setup()
        end,
    },


}

