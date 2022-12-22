

-- create autocommand to set variables
local augroup = vim.api.nvim_create_augroup('vimdows', { clear = true })

vim.api.nvim_create_autocmd({'BufAdd', 'BufEnter', 'BufLeave', 'WinEnter', 'WinLeave', 'BufWipeout'}, {
	group = augroup,
	desc = "Print all autocommand events",
	callback = function(event)
		vim.notify(event.event)
	end
})
