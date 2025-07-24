-- ai.lua: AI Code Completion Helpers (Copilot, Codeium, TabNine)

return {
    -- GitHub Copilot
    {
        "github/copilot.vim",
        event = "InsertEnter",
        config = function()
            vim.g.copilot_no_tab_map = true
            vim.api.nvim_set_keymap("i", "<Tab><Tab>", 'copilot#Accept("<CR>")', {
                expr = true,
                silent = true,
                noremap = true,
                replace_keycodes = false,
            })
        end
    },
    -- Codeium (Free alternative to Copilot)
    {
        "Exafunction/codeium.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "hrsh7th/nvim-cmp",
        },
        event = "InsertEnter",
        config = function()
            require("codeium").setup({})
        end,
    },

    -- TabNine (Optional fallback, slower than others)
    -- You can remove this if you're using Copilot/Codeium
    {
        "tzachar/cmp-tabnine",
        build = "./install.sh",
        dependencies = "hrsh7th/nvim-cmp",
        config = function()
            local tabnine = require("cmp_tabnine.config")
            tabnine:setup({
                max_lines = 1000,
                max_num_results = 5,
                sort = true,
                run_on_every_keystroke = true,
                snippet_placeholder = "..",
            })
        end,
    }
}
