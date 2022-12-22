-- Load everything from here
-- Map leader key early key early so recursive mappings are handled correctly
vim.g.mapleader = ' '

-- Main neovim configuration for builtin settings:
require('bjdm.settings')

-- Load plugins
require('bjdm.plugins')

-- Load LSP configurations
require('bjdm.lsp')

-- Load completion engine and extensions/configurations
require('bjdm.completion')

-- Load colorscheme and UI elements
require('bjdm.colours')

-- Load keymaps
require('bjdm.keymap')
