local lsp_config = require("lspconfig")
local configs = require("lspconfig.configs")

require("neodev").setup()

-- uncomment to debug
vim.lsp.set_log_level("warn")
require("vim.lsp.log").set_format_func(vim.inspect)

local function on_attach(client, bufnr)
	require("bjdm.lsp.keymap").setup(client, bufnr)
	require("bjdm.lsp.diagnostic").setup(client, bufnr)
	require("bjdm.lsp.formatting").setup(client, bufnr)
end

local servers = {
	pylsp = {
		settings = {
			pylsp = {
				plugins = {
					pycodestyle = {
						maxLineLength = 88
					},
					pylint = {
						args = {
							'--ignore=E501,E231',
							'-',
						},
						enabled = true,
						debounce = 200,
						ignore = { 'E501' },
						maxLineLength = 88
					},
					yapf = {
						enabled = true,
					}
				},
			},
		},
	},
	sumneko_lua = {
		settings = {
			Lua = {
				runtime = {
					version = 'LuaJIT',
					path = runtime_path,
				},
				diagnostics = {
					globals = { 'vim' },
				},
				workspace = {
					library = vim.api.nvim_get_runtime_file('', true),
					checkThirdParty = false,
				},
				telemetry = {
					enable = false,
				},
				completion = {
					callSnippet = "Replace"
				}
			}
		}
	},
	tsserver = {
		cmd = { "typescript-language-server", "--stdio" },
		filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
		init_options = {
			hostInfo = "neovim",
		},
	},
	clangd = {},
	html = {},
	dockerls = {},
	gopls = {},
	qmlls = {
		filetypes = { "qml", "qmljs" },
	}
}

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)


local options = {
	on_attach = on_attach,
	capabailities = capabilities,
	flags = {
		debounce_text_changes = 150,
	}
}

for server, config in pairs(servers) do
	config = vim.tbl_deep_extend("force", {}, options, config or {})
	lsp_config[server].setup(config)
end

lsp_config.tsserver.setup {}

-- KDE qml-lsp
-- Check if the config is already defined (useful when reloading this file)
print('setting up')
configs.qml_lsp = {
	default_config = {
		-- cmd = { "qml-lsp" },
		cmd = { "/tmp/scratch/qml-lsp/qml-lsp-static" },
		filetypes = { "qml", "qmljs" },
		root_dir = lsp_config.util.root_pattern("main.qml"),
		settings = {
			capabilities = { semanticTokensProvider = nil }
		},
	},
}
lsp_config.qml_lsp.setup {}


-- Null-ls
require("bjdm.lsp.null-ls").setup(on_attach)
