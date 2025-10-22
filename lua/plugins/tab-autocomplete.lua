-- lua/plugins/tab-autocomplete.lua
return {
  {
    "saghen/blink.cmp",
    opts = function(_, opts)
      opts.keymap = {
        preset = "super-tab", -- keeps snippet jumping etc.
        ["<Tab>"] = { "select_and_accept" }, -- confirm current item
        ["<C-j>"] = { "select_next" }, -- move down
        ["<C-i>"] = { "select_prev" }, -- move up (you can change to <C-k> if you prefer)
      }
    end,
  },
}
