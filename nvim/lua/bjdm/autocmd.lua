-- Augroups and autocommands
-- TODO move this somewhere more appropriate
packer_group = vim.api.nvim_create_augroup("au_packer", {})
vim.api.nvim_create_autocmd({'BufWritePost'}, {
	group = packer_group,
	pattern = "**/*/plugins/init.lua",
	command = "source <afile> | PackerSync",
})
