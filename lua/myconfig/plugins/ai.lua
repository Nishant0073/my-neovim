-- ai.lua: AI Code Completion Helpers (Copilot, Codeium, TabNine)

return {
    -- GitHub Copilot
    -- {
    --     "CopilotC-Nvim/CopilotChat.nvim",
    --     dependencies = {
    --         { "github/copilot.vim" }, -- or zbirenbaum/copilot.lua
    --         { "nvim-lua/plenary.nvim", branch = "master" }, -- for curl, log and async functions
    --     },
    --     build = "make tiktoken", -- Only on MacOS or Linux
    --     opts = {
    --         -- See Configuration section for options
    --         enabled = function()
    --             local ft = vim.bo.filetype
    --             return ft ~= "c" and ft ~= "cpp"
    --         end,
    --     },
    --     -- See Commands section for default commands if you want to lazy load on them
    -- },
    -- Codeium (Free alternative to Copilot)
    -- You can use Codeium with nvim-cmp
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
