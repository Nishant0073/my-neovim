    return {
    {
        "iamcco/markdown-preview.nvim",
        build = "cd app && npm install",
        ft = { "markdown" },
        config = function()
            vim.g.mkdp_auto_start = 1
            vim.g.mkdp_auto_close = 0
            vim.g.mkdp_browser = "brave"
            vim.g.mkdp_preview_options = {
                sync_scroll_type = "middle",
            }
        end,
    },
}
