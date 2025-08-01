vim.g.mapleader = ","
local keymap = vim.keymap


-- ======================
-- 🧭 Navigation (Telescope)
-- ======================
keymap.set("n", "<leader>ff", "<cmd>lua require('telescope.builtin').find_files()<CR>", { desc = "Find files" })
keymap.set("n", "<leader>fg", "<cmd>lua require('telescope.builtin').live_grep()<CR>", { desc = "Live grep" })
keymap.set("n", "<leader>fb", "<cmd>lua require('telescope.builtin').buffers()<CR>", { desc = "Buffers" })
keymap.set("n", "<leader>fh", "<cmd>lua require('telescope.builtin').help_tags()<CR>", { desc = "Help tags" })

-- ======================
-- 📁 File Explorer (neo-tree)
-- ======================
keymap.set("n", "<leader>ee", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" })
keymap.set("n", "<leader>ef", "<cmd>NvimTreeFindFile<CR>", { desc = "Find file in explorer" })
keymap.set("n", "<leader>ec", "<cmd>NvimTreeClose<CR>", { desc = "Close file explorer" })
keymap.set("n", "<leader>er", "<cmd>NvimTreeRefresh<CR>", { desc = "Refresh file explorer" })

-- ======================
-- 📄 Buffer Management
-- ======================

-- Navigate buffers
keymap.set("n", "<Tab>", "<cmd>BufferNext<CR>", { desc = "Next buffer" })
keymap.set("n", "<S-Tab>", "<cmd>BufferPrevious<CR>", { desc = "Previous buffer" })

-- Close buffers
keymap.set("n", "<leader>bd", "<cmd>BufferClose<CR>", { desc = "Close current buffer" })
keymap.set("n", "<leader>bo", "<cmd>BufferCloseAllButCurrent<CR>", { desc = "Close all but current" })
keymap.set("n", "<leader>bh", "<cmd>BufferCloseAllButVisible<CR>", { desc = "Close hidden buffers" })

-- Go to specific buffer by position
keymap.set("n", "<leader>1", "<cmd>BufferGoto 1<CR>", { desc = "Go to buffer 1" })
keymap.set("n", "<leader>2", "<cmd>BufferGoto 2<CR>", { desc = "Go to buffer 2" })
keymap.set("n", "<leader>3", "<cmd>BufferGoto 3<CR>", { desc = "Go to buffer 3" })
keymap.set("n", "<leader>4", "<cmd>BufferGoto 4<CR>", { desc = "Go to buffer 4" })
-- ======================
-- 🧠 LSP
-- ======================
keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename symbol" })
keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code action" })
keymap.set("n", "<leader>gd", vim.lsp.buf.definition, { desc = "Go to definition" })
keymap.set("n", "<leader>gr", vim.lsp.buf.references, { desc = "Go to references" })
keymap.set("n", "<leader>gi", vim.lsp.buf.implementation, { desc = "Go to implementation" })
keymap.set("n", "<leader>gt", vim.lsp.buf.type_definition, { desc = "Go to type definition" })
keymap.set("n", "<leader>gl", vim.diagnostic.open_float, { desc = "Show diagnostics" })
keymap.set("n", "<leader>gk", vim.diagnostic.goto_prev, { desc = "Previous diagnostic" })
keymap.set("n", "<leader>gj", vim.diagnostic.goto_next, { desc = "Next diagnostic" })
keymap.set("n", "<leader>gq", vim.diagnostic.setloclist, { desc = "Diagnostics to loclist" })
keymap.set("n", "<leader>gs", vim.lsp.buf.signature_help, { desc = "Signature help" })
keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Show documentation" })

-- Telescope for LSP
keymap.set("n", "<leader>ld", "<cmd>lua require('telescope.builtin').lsp_definitions()<CR>", { desc = "Telescope definitions" })
keymap.set("n", "<leader>lr", "<cmd>lua require('telescope.builtin').lsp_references()<CR>", { desc = "Telescope references" })
keymap.set("n", "<leader>li", "<cmd>lua require('telescope.builtin').lsp_implementations()<CR>", { desc = "Telescope implementations" })
keymap.set("n", "<leader>lt", "<cmd>lua require('telescope.builtin').lsp_type_definitions()<CR>", { desc = "Telescope type defs" })

-- ======================
-- 🐞 Debugging (nvim-dap)
-- ======================
keymap.set("n", "<F5>", "<cmd>lua require'dap'.continue()<CR>", { desc = "Start Debugging" })
keymap.set("n", "<F10>", "<cmd>lua require'dap'.step_over()<CR>", { desc = "Step Over" })
keymap.set("n", "<F11>", "<cmd>lua require'dap'.step_into()<CR>", { desc = "Step Into" })
keymap.set("n", "<F12>", "<cmd>lua require'dap'.step_out()<CR>", { desc = "Step Out" })
keymap.set("n", "<leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<CR>", { desc = "Toggle Breakpoint" })
keymap.set("n", "<leader>dr", "<cmd>lua require'dap'.repl.toggle()<CR>", { desc = "Toggle REPL" })

-- ======================
-- 🧪 Testing (neotest)
-- ======================
keymap.set("n", "<leader>tf", function() require("neotest").run.run(vim.fn.expand("%")) end, { desc = "Test File" })
keymap.set("n", "<leader>tn", function() require("neotest").run.run() end, { desc = "Test Nearest" })
keymap.set("n", "<leader>tl", function() require("neotest").run.run_last() end, { desc = "Run Last Test" })
keymap.set("n", "<leader>ts", function() require("neotest").summary.toggle() end, { desc = "Toggle Test Summary" })
keymap.set("n", "<leader>to", function() require("neotest").output.open({ enter = true }) end, { desc = "Show Test Output" })

-- ======================
-- 🧰 Terminal & Tasks
-- ======================
keymap.set("n", "<leader>tt", "<cmd>ToggleTerm<CR>", { desc = "Toggle Terminal" })
keymap.set("n", "<leader>lg", function()
  require("toggleterm.terminal").Terminal:new({ cmd = "lazygit", hidden = true }):toggle()
end, { desc = "LazyGit" })
keymap.set("n", "<leader>or", "<cmd>OverseerRun<CR>", { desc = "Run Task" })
keymap.set("n", "<leader>ot", "<cmd>OverseerToggle<CR>", { desc = "Toggle Task UI" })
keymap.set("n", "<leader>cb", "<cmd>OverseerRun<CR>", { desc = "Run compiler task" })
keymap.set("n", "<leader>cv", "<cmd>OverseerToggle<CR>", { desc = "Toggle task viewer" })

-- ======================
-- 🧼 Linting & Formatting
-- ======================
keymap.set("n", "<leader>lf", function() require("conform").format({ async = true }) end, { desc = "Format file" })
keymap.set("n", "<leader>ll", function() require("lint").try_lint() end, { desc = "Run Linter" })

-- ======================
-- 🌱 Git
-- ======================
keymap.set("n", "<leader>gs", "<cmd>Gitsigns stage_hunk<CR>", { desc = "Stage hunk" })
keymap.set("n", "<leader>gr", "<cmd>Gitsigns reset_hunk<CR>", { desc = "Reset hunk" })
keymap.set("n", "<leader>gb", "<cmd>Gitsigns blame_line<CR>", { desc = "Blame line" })
keymap.set("n", "<leader>gg", "<cmd>Neogit<CR>", { desc = "Open Neogit" })
keymap.set("n", "<leader>ggd", "<cmd>DiffviewOpen<CR>", { desc = "Open Diffview" })
keymap.set("n", "<leader>gh", "<cmd>DiffviewFileHistory<CR>", { desc = "File History" })

-- Telescope Git (lazy)
keymap.set("n", "<leader>ggb", "<cmd>lua require('telescope.builtin').git_branches()<CR>", { desc = "Git branches" })
keymap.set("n", "<leader>ggs", "<cmd>lua require('telescope.builtin').git_status()<CR>", { desc = "Git status" })
keymap.set("n", "<leader>ggc", "<cmd>lua require('telescope.builtin').git_commits()<CR>", { desc = "Git commits" })

-- ======================
-- ✨ General
-- ======================
keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode" })
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear highlights" })
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" })
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" })

-- ======================
-- 🪟 Window Splits
-- ======================
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Vertical split" })
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Horizontal split" })
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Equalize splits" })
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close split" })

-- ======================
-- 📑 Tabs
-- ======================
keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "New tab" })
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close tab" })
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Next tab" })
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Previous tab" })
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open file in new tab" })

-- ======================
-- 📚 Symbols Outline
-- ======================
keymap.set("n", "<leader>so", "<cmd>SymbolsOutline<CR>", { desc = "Toggle Symbols Outline" })

-- ======================
-- 📚 Touble handling error
-- ======================
keymap.set("n", "<leader>xx", function() require("trouble").toggle() end, { desc = "Toggle Trouble" })
keymap.set("n", "<leader>xw", function() require("trouble").toggle("workspace_diagnostics") end, { desc = "Workspace Diagnostics" })
keymap.set("n", "<leader>td", "<cmd>Trouble lsp_definitions<CR>", { desc = "LSP definitions in Trouble" })



