vim.g.mapleader = ","

local keymap = vim.keymap -- for conciseness
local builtin = require('telescope.builtin')

-- ======================
-- Telescope Keybindings
-- ======================
keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })

-- ======================
-- File Explorer (nvim-tree)
-- ======================
keymap.set("n", "<leader>ee", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" })
keymap.set("n", "<leader>ef", "<cmd>NvimTreeFindFileToggle<CR>", { desc = "Focus file in explorer" })
keymap.set("n", "<leader>ec", "<cmd>NvimTreeCollapse<CR>", { desc = "Collapse file explorer" })
keymap.set("n", "<leader>er", "<cmd>NvimTreeRefresh<CR>", { desc = "Refresh file explorer" })

-- ======================
-- Markdown Preview
-- ======================
keymap.set("n", "<leader>md", "<cmd>MarkdownPreviewToggle<CR>", { desc = "Toggle Markdown preview" })
keymap.set("n", "<leader>mc", "<cmd>MarkdownPreviewStop<CR>", { desc = "Stop Markdown preview" })
keymap.set("n", "<leader>ms", "<cmd>MarkdownPreview<CR>", { desc = "Start Markdown preview" })

-- ======================
-- Debugging (nvim-dap)
-- ======================
keymap.set("n", "<leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<CR>", { desc = "Toggle breakpoint" })
keymap.set("n", "<leader>dc", "<cmd>lua require'dap'.continue()<CR>", { desc = "Continue debugging" })
keymap.set("n", "<leader>di", "<cmd>lua require'dap'.step_into()<CR>", { desc = "Step into" })
keymap.set("n", "<leader>do", "<cmd>lua require'dap'.step_over()<CR>", { desc = "Step over" })
keymap.set("n", "<leader>du", "<cmd>lua require'dap'.step_out()<CR>", { desc = "Step out" })
keymap.set("n", "<leader>dr", "<cmd>lua require'dap'.repl.open()<CR>", { desc = "Open REPL" })
keymap.set("n", "<leader>dt", "<cmd>lua require'dap'.terminate()<CR>", { desc = "Terminate debugging" })

-- ======================
-- LSP Keybindings
-- ======================
keymap.set("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", { desc = "Rename symbol" })
keymap.set("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", { desc = "Code action" })
keymap.set("n", "<leader>gd", "<cmd>lua vim.lsp.buf.definition()<CR>", { desc = "Go to definition" })
keymap.set("n", "<leader>gr", "<cmd>lua vim.lsp.buf.references()<CR>", { desc = "Go to references" })
keymap.set("n", "<leader>gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", { desc = "Go to implementation" })
keymap.set("n", "<leader>gt", "<cmd>lua vim.lsp.buf.type_definition()<CR>", { desc = "Go to type definition" })
keymap.set("n", "<leader>gl", "<cmd>lua vim.diagnostic.open_float()<CR>", { desc = "Show diagnostics" })
keymap.set("n", "<leader>gk", "<cmd>lua vim.diagnostic.goto_prev()<CR>", { desc = "Previous diagnostic" })
keymap.set("n", "<leader>gj", "<cmd>lua vim.diagnostic.goto_next()<CR>", { desc = "Next diagnostic" })
keymap.set("n", "<leader>gq", "<cmd>lua vim.diagnostic.setloclist()<CR>", { desc = "Diagnostics to loclist" })
keymap.set("n", "<leader>gs", "<cmd>lua vim.lsp.buf.signature_help()<CR>", { desc = "Signature help" })

-- ======================
-- Telescope for LSP
-- ======================
keymap.set("n", "<leader>ld", builtin.lsp_definitions, { desc = "Telescope LSP definitions" })
keymap.set("n", "<leader>lr", builtin.lsp_references, { desc = "Telescope LSP references" })
keymap.set("n", "<leader>li", builtin.lsp_implementations, { desc = "Telescope LSP implementations" })
keymap.set("n", "<leader>lt", builtin.lsp_type_definitions, { desc = "Telescope LSP type definitions" })

-- ======================
-- Telescope for Git (Moved to <leader>gg to avoid conflicts)
-- ======================
keymap.set("n", "<leader>ggb", builtin.git_branches, { desc = "Telescope git branches" })
keymap.set("n", "<leader>ggs", builtin.git_status, { desc = "Telescope git status" })
keymap.set("n", "<leader>ggc", builtin.git_commits, { desc = "Telescope git commits" })

-- ======================
-- General
-- ======================
keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlight" })
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" })
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" })

-- ======================
-- Window Management
-- ======================
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Equalize window sizes" })
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })

-- ======================
-- Tab Management
-- ======================
keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" })
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" })
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" })
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" })
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" })

