return { -- Dressing for UI elements
    {
        "stevearc/dressing.nvim",
        config = function()
            require("dressing").setup({
                input = { enabled = true },
                select = {
                    backend = { "telescope", "builtin" },
                    telescope = { theme = "dropdown" },
                },
            })
        end,
    },

}
