local gb = require('git-blame')

gb.gitblame_ignored_filetypes = {
-- Builtin
'help',
-- Debug adapter
'dapui_scopes', 'dapui_breakpoints', 'dapui_stacks', 'dapui_watchpoints'
}
