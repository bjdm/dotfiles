call plug#begin('~/.config/nvim/plugins')

""""""""""""""""""""" NEOVIM """"""""""""""""""""""""
" generate and highlight ctags
"Plug 'c0r73x/neotags.nvim'

" Dark powered shell interface
Plug 'shougo/deol.nvim'

""""""""""""""""""""" VIM """""""""""""""""""""""""""
" Unicode metadata
Plug 'tpope/vim-characterize'

"""""""""""""""""" SYNTAX """""""""""""""""""""""""""
" javascript
Plug 'pangloss/vim-javascript', { 'for': ['javascript'] }

" typescript
Plug 'leafgarland/typescript-vim', { 'for': ['typescript', 'html'] }
Plug 'quramy/vim-js-pretty-template'

" python
Plug 'hdima/python-syntax'

"""""""""""""""" Compiler Tools """""""""""""""""""""
" typescript intellisense
Plug 'quramy/tsuquyomi', { 'for': ['typescript', 'html'] }

" Asynchronous linting
Plug 'neomake/neomake'

"""""""""""""""" Editor Tools """""""""""""""""""""""
" Asynchronous autocompletion
Plug 'Shougo/deoplete.nvim'

" Render HEX colour values
Plug 'gko/vim-coloresque'

" Easy commenting
Plug 'tpope/vim-commentary'

" Ultisnips and snippets
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" Show tags in sidebar ordered by scope
Plug 'majutsushi/tagbar'

" Pasting with destination indentation context
Plug 'sickill/vim-pasta'

" Extended repeat ie. '.' functionality
Plug 'tpope/vim-repeat'

" Multiple cursors
Plug 'terryma/vim-multiple-cursors'

" Move blocks of text
Plug 'matze/vim-move'

" Lazily update fold markers (for performance)
Plug 'konfekt/fastfold'

" Surround as an verb 
Plug 'tpope/vim-surround'

" auto insert pairs
Plug 'shougo/neopairs.vim'

"""""""""""""" ENVIRONMENT TOOLS """"""""""""""""""""
" Asynchronous command execution library
Plug 'shougo/vimproc.vim', {'do': 'make'}

" Fast recursive dir searching
Plug 'rking/ag.vim'

""""""""""""""" USER INTERFACE """"""""""""""""""""""

" Smooth scrolling
Plug 'terryma/vim-smooth-scroll'

" Indentation highlighting
Plug 'nathanaelkane/vim-indent-guides'

" Asyncronous file browser. NOTE: this does not have feature parity yet
"Plug 'mackeybj/denite.nvim'
Plug 'shougo/neomru.vim'			" add mru file source
Plug 'shougo/neoyank.vim'			" add yank source
Plug 'shougo/tabpagebuffer.vim'		" add buffer_tab source

Plug 'shougo/unite.vim'			" for testing

" Fast grep searching using ack
Plug 'mileszs/ack.vim'

call plug#end()
