local lsp_config = require("lspconfig")

require("neodev").setup()

-- uncomment to debug
vim.lsp.set_log_level("info")
require("vim.lsp.log").set_format_func(vim.inspect)

local function on_attach(client, bufnr)
	require("bjdm.lsp.keymap").setup(client, bufnr)
	require("bjdm.lsp.diagnostic").setup(client, bufnr)
	require("bjdm.lsp.formatting").setup(client, bufnr)
end

require("bjdm.lsp.null-ls").setup(on_attach)

local servers = {
	pylsp = {
		settings = {
			pylsp = {
				plugins = {
					pycodesylte = {
						ignore = {'W501'},
						maxLineLength = 88
					},
					pylint = {
						args = {
							'--ignore=E501,E231',
							'-',
						},
						enabled=true,
						debounce=200,
					},
				},
			},
		},
		sumneko_lua = {
			settings = {
				Lua = {
					completion = {
						callSnippet = "Replace"
					}
				}
			}
		},
		tsserver = {
			cmd = { "typescript-language-server", "--stdio"},
			filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
			init_options = {
				hostInfo = "neovim",
			},
		},
		clangd = {},
		html = {},
		dockerls = {},
	},
}

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)


local options = {
	on_attach = require ("bjdm.lsp.keymap").on_attach,
	capabailities = capabilities,
	flags = {
		debounce_text_changes = 150,
	}
}

for server, config in pairs(servers) do
	lsp_config[server].setup(vim.tbl_extend("force", options, config))
end

lsp_config.tsserver.setup{}
