local log = require('bjdm.log')

local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
		vim.cmd [[packadd packer.nvim]]
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()


return require('packer').startup(function(use)
	use "wbthomason/packer.nvim"
	-- LSP
	use 'neovim/nvim-lspconfig'								-- Language Server Protocol configurations
	use 'nvim-lua/lsp-status.nvim'
	use 'nvim-lua/diagnostic-nvim'
	use 'tjdevries/nlua.nvim'
	use 'onsails/lspkind-nvim'									-- Fancy LSP icons (requires patched font ie. nerd font or font awesome)
	use 'hrsh7th/cmp-nvim-lsp'

	use 'folke/lua-dev.nvim'

	-- integrate alternate sources into LSP
	use {
		'jose-elias-alvarez/null-ls.nvim',
		requires = {
			'nvim-lua/plenary.nvim',
			'theprimeagen/refactoring.nvim'
		},
	}
	use { 'folke/trouble.nvim' }

	-- Treesitter
	use {
		'nvim-treesitter/nvim-treesitter',
		requires = {
			'nvim-treesitter/completion-treesitter',		-- Provide treesitter completions
			'nvim-treesitter/nvim-treesitter-textobjects',	-- additional textobject from treesitter ie. class etc.
			'nvim-treesitter/playground',					-- Inspect the AST
			'romgrk/nvim-treesitter-context',				-- Contextual function/signature info
			'p00f/nvim-ts-rainbow'							-- Context aware matched syntax highlighting
		},
		run = ':TSUpdate',
	}

	-- Completion
	use {
		'hrsh7th/nvim-cmp',
		requires = {
			'hrsh7th/cmp-nvim-lsp',							-- Language server protocols
			'hrsh7th/cmp-buffer',							-- sources from within buffer
			'hrsh7th/cmp-path',								-- sources from path
			'hrsh7th/cmp-cmdline',							-- sources from command line
		}
	}

	-- Snippets
	use {
		'L3MON4D3/LuaSnip',
		requires = {
			'saadparwaiz1/cmp_luasnip'						-- Full feature lua snippet engine
		}
	}

	-- DAP
	use 'mfussenegger/nvim-dap'
	use {
		'rcarriga/nvim-dap-ui',
		requires = {'mfussenegger/nvim-dap'},
	}
	use { 'theHamsta/nvim-dap-virtual-text', requires = {'mfussenegger/nvim-dap'} }
	use { 'mfussenegger/nvim-dap-python',
	requires = {'mfussenegger/nvim-dap'},
	-- TODO auto install debugpy in a dedicated virtualenv
}
require('bjdm.plugins.dap')

use 'leoluz/nvim-dap-go'								-- out of the box config for using delve

-- Telescope
use {
	'nvim-telescope/telescope.nvim',
	requires = {
		{'nvim-lua/plenary.nvim'},
		{'BurntSushi/ripgrep'},
		{'nvim-treesitter/nvim-treesitter'},
		{'sharkdp/fd'},
		{'nvim-telescope/telescope-fzf-native.nvim',
		run = {
			'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'
		}
	}
}
	}
	require('bjdm.plugins.telescope')


	-- Editor tools
	use {
		'numToStr/Comment.nvim',
		config = function()
			require('Comment').setup()
		end
	}
	use {
		'windwp/nvim-autopairs',
		config = function()
			require('nvim-autopairs').setup {}
		end
	}


	use 'nvim-lua/popup.nvim'
	-- Optional
	use 'sharkdp/bat'											-- preview
	use 'kyazdani42/nvim-web-devicons'			-- fancy icons

	use 'BurntSushi/ripgrep'
	use 'sharkdp/fd'

	-- User Interface
	use {
		'rebelot/heirline.nvim',
		requires = { 'kyazdani42/nvim-web-devicons' },
	}
	require('bjdm.plugins.heirline')
	use {
		'nvim-zh/colorful-winsep.nvim'			-- highlights border of active window
	}
	use {
		'folke/noice.nvim',
		config = function()
			require("noice").setup()
		end,
		requires = {
			-- If lazy loading, check note regarding proper 'module="..."' on github
			"Muniftanjim/nui.nvim",
			"rcarriga/nvim-notify"
		}
	}
	use {
		'folke/which-key.nvim',
		config = function()
			require("which-key").setup{}
		end
	}
	use {
		'kyazdani42/nvim-tree.lua',
		requires = { 'kyazdani42/nvim-web-devicons' }
	}
	require('bjdm.plugins.nvim-tree')
	use 'lukas-reineke/indent-blankline.nvim'
	require('bjdm.plugins.indent-blankline')


	-- Colourscheme
	use 'folke/tokyonight.nvim'								-- Colour scheme

	-- Misc/Environment
	use 'christoomey/vim-tmux-navigator'		-- Seamless tmux pane navigation
	use 'famiu/bufdelete.nvim'						-- Better buffer handling

	use {
		'rmagatti/auto-session',
		config = function()
			require("auto-session").setup {
				log_level = "error",
				auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/"},
				auto_session_root_dir = vim.fn.stdpath('state').."/sessions/",
			}
		end
	}

	-- Github
	use 'tpope/vim-fugitive'
	use 'tpope/vim-rhubarb'
	use {
		'lewis6991/gitsigns.nvim',
		requires = { 'nvim-lua/plenary.nvim' }
	}
	require('bjdm.plugins.nvim-tree')
	use 'sindrets/diffview.nvim'


	use 'f-person/git-blame.nvim'					-- git blame

	---- Language/Tool Specific
	use 'peterhoeg/vim-qml'

	if packer_bootstrap then
		require('packer').sync()
	end
end)
