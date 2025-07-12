  return {-- Git signs
    {
        "lewis6991/gitsigns.nvim",
        config = function()
            require("gitsigns").setup({
                signs = {
                    add = { text = "│" },
                    change = { text = "│" },
                    delete = { text = "─" },
                    topdelete = { text = "─" },
                    changedelete = { text = "~" },
                },
                numhl = false,
                linehl = false,
                word_diff = false,
            })
        end,
    },

}
