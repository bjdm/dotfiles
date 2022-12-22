--require('bjdm.completion')
-- Behaviour ---------------------------------------------------------------------------------------------{{{
-- Enable modeline (comment string at end of file to override settings)
vim.opt.modeline	= true
vim.opt.modelines	= 1

-- Enable mouse
vim.opt.mouse		= 'nvi'

-- Popup menu
vim.opt.wildoptions	= 'pum'						-- display completion with popup menu
vim.opt.wildmenu	= true					-- command completion
vim.opt.wildmode	= { 'longest', 'list' }				-- completion order for wildcard
vim.opt.wildignore	= { '*.o', '*~', '*.pyc', '*pycache*' }		-- ignore compiled files

-- Command behaviour
vim.opt.inccommand	= 'nosplit'					-- live substitution update

-- History behaviour
-- Note: using undodir and undofile, not swap
vim.opt.swapfile	= false
vim.opt.backup		= false
vim.opt.undodir		= vim.fn.stdpath "data" .. "undodir"
vim.opt.undofile	= true

-- Buffer
vim.opt.hidden		= false						-- don't use hidden buffers TODO: learn more

-- Window behaviour
vim.opt.equalalways	= false						-- make windows the same size
vim.opt.splitright	= true						-- defaults splits to right
vim.opt.splitbelow	= true						-- defaults splits to below

-- Search behaviour
vim.opt.ignorecase		= true						-- ignore case sensitivty when searching
vim.opt.smartcase		= true						-- use case sensitivity when used
vim.opt.hlsearch		= true						-- highlight matches when searching
vim.opt.incsearch		= true						-- incrementally update search ui
vim.opt.magic			= true						-- enable magic regexes

-- Tab behaviour
vim.opt.shiftwidth		= 4						-- 
vim.opt.tabstop			= 4						--
vim.opt.softtabstop		= 4						--
vim.opt.expandtab		= true						--
vim.opt.smarttab		= true						--
vim.opt.shiftround		= true 						-- round indents to multiples of shiftwidth
vim.opt.autoindent		= true						--
vim.opt.cindent			= true						-- use c indent style for new lines
vim.opt.expandtab		= false						-- expand tabs to spaces

-- Wrapping and line breaks
vim.opt.wrap		= true						-- wrap long lines
vim.opt.wrapmargin	= 4						-- margin before wrapping
vim.opt.linebreak	= true						-- set soft wrapping
vim.opt.breakindent	= true						-- preserve horizontal blocks of text
vim.opt.showbreak	= string.rep(' ', 3)				-- string at start of wrapped lines

-- Folding behaviour
vim.opt.foldmethod	= 'syntax'					-- fold using syntax
vim.opt.foldlevel	= 2						-- close *some* folds
vim.opt.foldnestmax	= 4						-- maximum fold level

-- Misc.
vim.opt.belloff		= 'all'						-- turn off terminal bells
vim.opt.clipboard	= 'unnamedplus'					-- always use same clipboard
vim.opt.exrc		= true						-- allow project specific configs
vim.opt.timeoutlen  = 400
vim.opt.ttimeoutlen = 400

-- }}}

-- User Interface --------------------------------------------------------------------------------------------{{{
-- General
vim.opt.title		= true						-- set terminal title
vim.opt.lazyredraw	= false						-- let macros finish before redrawing
vim.opt.updatetime	= 500						-- screen redraw time

-- Text area
vim.opt.number			= true						-- show line numbers
vim.opt.relativenumber	= true						-- show relative line numbers
vim.opt.cursorline		= true						-- highlight the cursor line
vim.opt.scrolloff		= 10						-- scroll with x padding
vim.opt.showmatch		= true						-- highlight matching syntax
vim.opt.signcolumn		= 'yes'					-- set sign column and width
-- TODO: Set per filetype
--vim.opt.colorcolumn	= 80						-- highlight column when reached

-- Status line
vim.opt.laststatus		= 3							-- always show statusbar
vim.opt.showcmd			= true						-- show command on statusbar
vim.opt.showmode		= true						-- show mode on statusline
vim.opt.cmdheight		= 1							-- height of cmd window
vim.opt.ruler			= true						-- show ruler on  status line
vim.opt.list				= true				-- enable virtual text showing whitespace
-- listchars:
--		nbsp	->		non-breaking space ie. can not be substituted for a linebreak
--		tab		->		tab
--		eol		->		eol
--		trail	->		trailing backspace
--		extends ->	signify text to right of viewport
--		precedes ->	signify text to left of viewport
--vim.opt.listchars = {}
vim.opt.listchars["tab"] = "◀━▶"
--vim.opt.listchars["eol"] = "↲"
--vim.opt.listchars["nbsp"] = "␣"
-- vim.opt.listchars["trail"] = "•"
-- vim.opt.listchars["extends"] = "⟩"
-- vim.opt.listchars["precedes"] = "⟨"
vim.opt.winbar			= '%f'
--vim.opt.rulerformat		= '%10(%c%V\ %p%%%)'				-- ruler format

-- Tab line
vim.opt.showtabline	= 2						-- always show tabline

-- Popup menu
vim.opt.pumblend	= 17						-- transparent popup menu

--}}}
