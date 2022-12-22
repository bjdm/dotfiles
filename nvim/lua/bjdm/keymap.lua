local M = {}

local wk = require("which-key")

-- Which-key
wk.register({
	["<leader>"] = {
		["?"] = {"<cmd>WhichKey<cr>", "Show hints for all mappings"},
	}
})

-- Telescope
wk.register({
	["<leader>"] = {
		f = {
			name = "Telescope",
			f = {"<cmd>Telescope find_files<cr>", "Telescope: Fuzzy file find"},
			r = {"<cmd>Telescope oldfiles<cr>", "Telescope: Fuzzy recent file find"},
			b = {"<cmd>Telescope buffers<cr>", "Telescope: Fuzzy buffer search"},
			h = {"<cmd>Telescope help_tags<cr>", "Telescope: Fuzzy help tags search"},
			g = {"<cmd>Telescope live_grep<cr>", "Telescope: Fuzzy live grep search"},
			["<enter>"] = {"<cmd>Telescope builtins<cr>", "Telescope: Builtin search"},
		},
	},
})

-- Terminal control
wk.register({
	name = "Terminal Control",
	["<Esc>"] = {"<C-\\><C-n>", "Terminal: Exit to normal mode", mode="t"},
	["<C-Esc>"] = {"<Esc>", "Terminal: Send escape to readline", mode="t", nowait=true},
})

-- Nvim-tree and file operations
wk.register({
	name = "Nvim-Tree",
	["<C-w>"] = {
		e = {":NvimTreeToggle<cr>", "File Explorer: Toggle Nvim-tree"},
	}
})

-- Buffer/window management
wk.register({
	["<C-b>"] = {
		name = "Buffer Management",
		l = {"<cmd>bnext<cr>", "Buffers: Move to next buffer in buffer list"},
		h = {"<cmd>bprev<cr>", "Buffers: Move to previous buffer in buffer list"},
		c = {"<cmd>Bdelete<cr>", "Buffers: Close buffer leaving window open"},
		C = {"<cmd>bdelete<cr>", "Buffers: Close buffer also closing window"},
	}
})

-- LSP
wk.register({
	["<leader>"] = {
		e = {vim.diagnostic.open_float, "LSP: open diagnostics in new floating window"},
		E = {"<cmd>lua vim.diagnostic.open_float({scope='b'})<cr>", "LSP: open diagnostics in new floating window"},
		q = {vim.diagnostic.setloclist, "LSP: add buffer diagnostics to location list"},
	},
	[']'] = {
		d = { vim.diagnostic.goto_next, "LSP: go to next diagnostic in quickfix list"},
	},
	['['] = {
		d = { vim.diagnostic.goto_prev, "LSP: go to previous diagnostic in quickfix list"}, },
})

-- LSP
-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local map_lsp_on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)
end

-- Debug Adapter Protocol
wk.register({
	["<leader>"] = {
		["<F5>"] = {"<cmd>lua require('dapui').toggle<cr>", "Debugging: Toggle DAP UI"},
		db = {"<cmd>lua require('dap').toggle_breakpoint<cr>", "Debugging: Toggle breakpoint"},
		dB = {"<cmd>lua require('dap').toggle_breakpoint(vim.fn.input('Breakpoint condition: '))<cr>", "Debugging: Toggle breakpoint"},
		dl = {"<cmd>lua requires('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<cr>", "Debugging: Set breakpoint log message"}
	},
	["<F10>"] = {"<cmd>lua require('dap').step_over<cr>", "Debugging: Step over function"},
	["<F11>"] = {"<cmd>lua require('dap').step_into<cr>", "Debugging: Step into function"},
	["<F12>"] = {"<cmd>lua require('dap').step_out<cr>", "Debugging: Step into function"},
})
vim.keymap.set('n', '<Leader>dt', require('dap-python').test_method, { noremap = true, silent = true, nowait=true, desc = 'Debugging: Test method under cursor'})
-- nnoremap <silent> <Leader>dr <Cmd>lua require'dap'.repl.open()<CR>
-- nnoremap <silent> <Leader>dl <Cmd>lua require'dap'.run_last()<CR>
