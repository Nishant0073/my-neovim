#!/bin/bash

# Define the base directory
CONFIG_DIR="$HOME/.config/nvim"
LUA_DIR="$CONFIG_DIR/lua/myconfig"

# Create directory structure
echo "Creating Neovim config directory structure..."

mkdir -p "$LUA_DIR/core"
mkdir -p "$LUA_DIR/plugins"
mkdir -p "$LUA_DIR/ui"

# Create empty files
touch "$CONFIG_DIR/init.lua"

# Core files
touch "$LUA_DIR/core/options.lua"
touch "$LUA_DIR/core/keymaps.lua"
touch "$LUA_DIR/core/autocommands.lua"

# Plugin category files
touch "$LUA_DIR/plugins/init.lua"
touch "$LUA_DIR/plugins/compiler.lua"
touch "$LUA_DIR/plugins/debugger.lua"
touch "$LUA_DIR/plugins/git.lua"
touch "$LUA_DIR/plugins/completion.lua"
touch "$LUA_DIR/plugins/syntax.lua"
touch "$LUA_DIR/plugins/navigation.lua"
touch "$LUA_DIR/plugins/linting.lua"
touch "$LUA_DIR/plugins/testing.lua"
touch "$LUA_DIR/plugins/terminal.lua"
touch "$LUA_DIR/plugins/project.lua"
touch "$LUA_DIR/plugins/lsp.lua"

# UI
touch "$LUA_DIR/ui/theme.lua"
touch "$LUA_DIR/ui/statusline.lua"

# Utils
touch "$LUA_DIR/utils.lua"

echo "✅ Neovim IDE-like structure created at $CONFIG_DIR"

