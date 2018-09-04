"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Nvim Settings
"

" ignore case sensitivity on search UNLESS using capital letters
"
set ignorecase
set smartcase

" show (and set) invisible characters
"
set listchars=tab:│⬞,trail:•,extends:❯,precedes:❮
set showbreak=↪\ " comment added to make the space character more obvious
set list
set breakindent

" Show the line and column number of the cursor position
"
set ruler

" Show the relative line number in front of each line
"
set number
set relativenumber

" set the vertical and horizontal scroll offset
"
set scrolloff=3
set sidescrolloff=3

" do not redraw while running macros
"
set lazyredraw

" set window splitting below and to the right
"
set splitbelow
set splitright

" show bracket matches
" add <> to the match pairs
"
set showmatch
set matchpairs+=<:>

" autoindent for code
"
set autoindent
set cindent

" tab settings (tab inserts real tabs and viewed as four spaces)
"
set tabstop=4
set shiftwidth=4
set softtabstop=0
set noexpandtab
set nosmarttab

" do not wrap lines (but when we do, don't split words)
"
set nowrap
set linebreak

" Do not resize windows after splitting/closing a window
"
set noequalalways

" use the mouse
"
set mouse=a

" set <leader> *before* any mappings
"
let mapleader = "\<Space>"
