return {
    -- Debugging
    {
        "mfussenegger/nvim-dap",
        dependencies = {
            "nvim-neotest/nvim-nio",
            "rcarriga/nvim-dap-ui",
            "theHamsta/nvim-dap-virtual-text",
        },
        config = function()
            require("dapui").setup()
            require("nvim-dap-virtual-text").setup()
            -- Additional DAP configuration can go here
        end,
    },

}
