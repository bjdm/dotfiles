call plug#begin('~/.config/nvim/plugins')
 
" Unicode metadata
Plug 'tpope/vim-characterize'

" Easy commenting
Plug 'tpope/vim-commentary'

" Fuzzy file and buffer finder 
Plug 'ctrlpvim/ctrlp.vim'

" Improved python syntax
Plug 'hdima/python-syntax'

" Ultisnips and snippets
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" Show tags in sidebar ordered by scope
Plug 'majutsushi/tagbar'

" Indentation highlighting
Plug 'nathanaelkane/vim-indent-guides'

" Smooth scrolling
Plug 'terryma/vim-smooth-scroll'

" Asynchronous autocompletion
Plug 'Shougo/deoplete.nvim'

" Asynchronous linting
Plug 'neomake/neomake'

" Pasting with destination indentation context
Plug 'sickill/vim-pasta'

" Surround as an verb 
Plug 'tpope/vim-surround'

" Extended repeat ie. '.' functionality
Plug 'tpope/vim-repeat'

Plug 'terryma/vim-multiple-cursors'

" Move blocks of text
Plug 'matze/vim-move'

" Lazily update fold markers (for performance)
Plug 'konfekt/fastfold'

" File browser
Plug 'shougo/unite.vim'

" Asyncronous file browser. NOTE: this does not have feature parity yet
Plug 'shougo/denite.nvim'

" Asynchronous command execution library
Plug 'shougo/vimproc.vim', {'do': 'make'}

call plug#end()
