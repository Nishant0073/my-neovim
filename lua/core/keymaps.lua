vim.g.mapleader = ","

local keymap = vim.keymap -- for conciseness


-- telescope  keybindings
local builtin = require('telescope.builtin')

keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })

-- nvim-tree keybindings
keymap.set("n", "<leader>ee", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" }) -- toggle file explorer
keymap.set("n", "<leader>ef", "<cmd>NvimTreeFindFileToggle<CR>", { desc = "Toggle file explorer on current file" }) -- toggle file explorer on current file
keymap.set("n", "<leader>ec", "<cmd>NvimTreeCollapse<CR>", { desc = "Collapse file explorer" }) -- collapse file explorer
keymap.set("n", "<leader>er", "<cmd>NvimTreeRefresh<CR>", { desc = "Refresh file explorer" }) -- refresh file explorer

-- Markdown keybindings
keymap.set("n", "<leader>md", "<cmd>MarkdownPreviewToggle<CR>", { desc = "Toggle Markdown preview" }) -- toggle markdown preview
keymap.set("n", "<leader>mc", "<cmd>MarkdownPreviewStop<CR>", { desc = "Stop Markdown preview" }) -- stop markdown preview
keymap.set("n", "<leader>ms", "<cmd>MarkdownPreview<CR>", { desc = "Start Markdown preview" }) -- start markdown preview


-- debugging keybindings
keymap.set("n", "<leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<CR>", { desc = "Toggle breakpoint" }) -- toggle breakpoint
keymap.set("n", "<leader>dc", "<cmd>lua require'dap'.continue()<CR>", { desc = "Continue debugging" }) -- continue debugging
keymap.set("n", "<leader>di", "<cmd>lua require'dap'.step_into()<CR>", { desc = "Step into" }) -- step into
keymap.set("n", "<leader>do", "<cmd>lua require'dap'.step_over()<CR>", { desc = "Step over" }) -- step over
keymap.set("n", "<leader>du", "<cmd>lua require'dap'.step_out()<CR>", { desc = "Step out" }) -- step out
keymap.set("n", "<leader>dr", "<cmd>lua require'dap'.repl.open()<CR>", { desc = "Open REPL" }) -- open REPL
keymap.set("n", "<leader>dt", "<cmd>lua require'dap'.terminate()<CR>", { desc = "Terminate debugging" }) -- terminate debugging

-- LSP keybindings
keymap.set("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", { desc = "Rename symbol" }) -- rename symbol
keymap.set("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", { desc = "Code action" }) -- code action
keymap.set("n", "<leader>gd", "<cmd>lua vim.lsp.buf.definition()<CR>", { desc = "Go to definition" }) -- go to definition
keymap.set("n", "<leader>gr", "<cmd>lua vim.lsp.buf.references()<CR>", { desc = "Go to references" }) -- go to references
keymap.set("n", "<leader>gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", { desc = "Go to implementation" }) -- go to implementation
keymap.set("n", "<leader>gt", "<cmd>lua vim.lsp.buf.type_definition()<CR>", { desc = "Go to type definition" }) -- go to type definition
keymap.set("n", "<leader>gl", "<cmd>lua vim.diagnostic.open_float()<CR>", { desc = "Show diagnostics" }) -- show diagnostics
keymap.set("n", "<leader>gk", "<cmd>lua vim.diagnostic.goto_prev()<CR>", { desc = "Go to previous diagnostic" }) -- go to previous diagnostic
keymap.set("n", "<leader>gj", "<cmd>lua vim.diagnostic.goto_next()<CR>", { desc = "Go to next diagnostic" }) -- go to next diagnostic
keymap.set("n", "<leader>gq", "<cmd>lua vim.diagnostic.setloclist()<CR>", { desc = "Set diagnostics to location list" }) -- set diagnostics to location list
keymap.set("n", "<leader>gs", "<cmd>lua vim.lsp.buf.signature_help()<CR>", { desc = "Show signature help" }) -- show signature help

-- telescope keybindings for LSP
keymap.set("n", "<leader>ld", builtin.lsp_definitions, { desc = "Telescope LSP definitions" }) -- LSP definitions
keymap.set("n", "<leader>lr", builtin.lsp_references, { desc = "Telescope LSP references" }) -- LSP references
keymap.set("n", "<leader>li", builtin.lsp_implementations, { desc = "Telescope LSP implementations" }) -- LSP implementations
keymap.set("n", "<leader>lt", builtin.lsp_type_definitions, { desc = "Telescope LSP type definitions" }) -- LSP type definitions

-- telescope keybindings for git
keymap.set("n", "<leader>gib", builtin.git_branches, { desc = "Telescope git branches" }) -- git branches
keymap.set("n", "<leader>gis", builtin.git_status, { desc = "Telescope git status" }) -- git status
keymap.set("n", "<leader>gic", builtin.git_commits, { desc = "Telescope git commits" }) -- git commits
keymap.set("n", "<leader>gib", builtin.git_branches, { desc = "Telescope git branches" }) -- git branches


-- general keybindings

keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "clear seach hightlight" })

keymap.set("n", "<leader>+", "<C-a>", { desc = "increment number" })
keymap.set("n", "<leader>-", "<C-x>", { desc = "decrement number" })

-- winwwos management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "split window vertically" })
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "split window horizontally" })
keymap.set("n", "<leader>se", "<C-w>=", { desc = "make split window equal size" })
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })

keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" })
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" })
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "go to next tab" })
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "go to prev tab" })
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "open current buffet in new tab" })
