    return {-- Status line
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons", opt = true },
        config = function()
        require("lualine").setup({
            options = {
            theme = "gruvbox",
            section_separators = "",
            component_separators = "",
            },
        })
        end,
    },

}
