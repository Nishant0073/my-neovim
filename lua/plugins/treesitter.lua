require("nvim-treesitter.configs").setup({
    ensure_installed = { "c", "lua", "cpp", "c_sharp" },
    highlight = { enable = true },
    indent = { enable = true },
    view = {
        width = 35,
        relativenumber = true,
    },
    -- change folder arrow icons
    renderer = {
        indent_markers = {
            enable = true,
        },
        icons = {
            glyphs = {
                folder = {
                    arrow_closed = "→", -- arrow when folder is closed
                    arrow_open = "↓", -- arrow when folder is open
                },
            },
        },
    },
    -- disable window_picker for
    -- explorer to work well with
    -- window splits
    actions = {
        open_file = {
            window_picker = {
                enable = false,
            },
        },
    },
    filters = {
        custom = { ".DS_Store" },
    },
    git = {
        ignore = false,
    },
})

