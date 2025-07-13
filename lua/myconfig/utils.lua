local M = {}

local uv = vim.loop
local api = vim.api

-- 🔍 Pretty print Lua tables or values (debugging)
function M.dump(value, label)
  label = label or "Value"
  print(label .. ":")
  print(vim.inspect(value))
end

-- 🔁 Reload a module
function M.reload(module)
  package.loaded[module] = nil
  return require(module)
end

-- 📦 Check if plugin is loaded
function M.has_plugin(name)
  local lazy = require("lazy.core.config").plugins
  return lazy[name] ~= nil and lazy[name]._.loaded
end

-- 🧠 Get current buffer's filetype
function M.filetype()
  return vim.bo.filetype
end

-- 🧪 Check if buffer has given filetype
function M.is_filetype(ft)
  return vim.bo.filetype == ft
end

-- ✂️ Trim string
function M.trim(s)
  return s and s:match("^%s*(.-)%s*$") or s
end

-- 🧵 Join paths safely
function M.join_path(...)
  return table.concat({ ... }, "/")
end

-- 📁 Check if path is a directory
function M.is_dir(path)
  local stat = uv.fs_stat(path)
  return stat and stat.type == "directory"
end

-- 📄 Check if path is a file
function M.is_file(path)
  local stat = uv.fs_stat(path)
  return stat and stat.type == "file"
end

-- 📜 Read file contents (small files)
function M.read_file(path)
  local fd = assert(uv.fs_open(path, "r", 438)) -- 0666 octal
  local stat = assert(uv.fs_fstat(fd))
  local data = assert(uv.fs_read(fd, stat.size, 0))
  uv.fs_close(fd)
  return data
end

-- 💾 Write string to file
function M.write_file(path, content)
  local fd = assert(uv.fs_open(path, "w", 438))
  assert(uv.fs_write(fd, content, 0))
  uv.fs_close(fd)
end

-- 🔗 Check if command exists in $PATH
function M.executable(cmd)
  return vim.fn.executable(cmd) == 1
end

-- 🧠 Set keymap (noremap + silent default)
function M.map(mode, lhs, rhs, desc)
  local opts = { noremap = true, silent = true, desc = desc }
  vim.keymap.set(mode, lhs, rhs, opts)
end

-- 🧼 Clear search highlight
function M.clear_search()
  vim.cmd("nohlsearch")
end

-- ⌛ Defer function (in ms)
function M.defer(fn, ms)
  vim.defer_fn(fn, ms)
end

-- 🗃️ Get root directory (LSP or .git or cwd)
function M.get_root()
  local clients = vim.lsp.get_active_clients({ bufnr = 0 })
  for _, client in pairs(clients) do
    local workspace = client.config.root_dir
    if workspace and M.is_dir(workspace) then
      return workspace
    end
  end
  local git_root = vim.fn.systemlist("git rev-parse --show-toplevel")[1]
  if git_root and M.is_dir(git_root) then
    return git_root
  end
  return vim.loop.cwd()
end

-- 📌 Create autocommand
function M.autocmd(event, pattern, callback, group)
  local augroup = api.nvim_create_augroup(group or "MyAutoGroup", { clear = false })
  api.nvim_create_autocmd(event, {
    group = augroup,
    pattern = pattern,
    callback = callback,
  })
end

return M

