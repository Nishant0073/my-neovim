local keymap = vim.keymap.set
local cpp = {}

-- Determine file type
local function get_cmd()
  local file = vim.fn.expand("%")
  local output = vim.fn.expand("%:r")
  local ext = vim.fn.expand("%:e")
  if ext == "c" then
    return string.format("gcc %s -o %s && ./%s", file, output, output)
  elseif ext == "cpp" then
    return string.format("g++ -std=c++17 %s -o %s && ./%s", file, output, output)
  else
    print("Not a C/C++ file")
    return ""
  end
end

-- Run the build/run command
cpp.run = function()
  local cmd = get_cmd()
  if cmd ~= "" then
    vim.cmd("split | terminal " .. cmd)
  end
end

-- Optional: using toggleterm
cpp.term_run = function()
  local cmd = get_cmd()
  if cmd ~= "" then
    require("toggleterm.terminal").Terminal
      :new({ cmd = cmd, hidden = true, direction = "float" })
      :toggle()
  end
end

-- Optional: build only (no run)
cpp.build = function()
  local file = vim.fn.expand("%")
  local output = vim.fn.expand("%:r")
  local ext = vim.fn.expand("%:e")

  local cmd = ""
  if ext == "c" then
    cmd = string.format("gcc %s -o %s", file, output)
  elseif ext == "cpp" then
    cmd = string.format("g++ -std=c++17 %s -o %s", file, output)
  end

  if cmd ~= "" then
    vim.cmd("split | terminal " .. cmd)
  end
end

-- Keybindings
keymap("n", "<leader>cr", cpp.run, { desc = "Compile & run C/C++", noremap = true, silent = true })
keymap("n", "<leader>cb", cpp.build, { desc = "Compile only C/C++", noremap = true, silent = true })

-- ToggleTerm version
keymap("n", "<leader>ct", cpp.term_run, { desc = "Run C/C++ in floating terminal", noremap = true, silent = true })

return cpp

