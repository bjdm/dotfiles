

local augroup = vim.api.nvim_create_augroup('scratch-test', { clear = true })

vim.api.nvim_create_autocmd({'BufAdd', 'BufEnter', 'BufLeave', 'WinEnter', 'WinLeave', 'BufWipeout'}, {
	group = augroup,
	pattern = "Scratch",
	desc = "Debug when scratch buffers are created",
	callback = function(event)
		vim.notify(event.event)
	end
})
