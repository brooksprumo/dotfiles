"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins
"

if has('nvim')
	if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
		silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
					\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
		autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
	endif
else
	if empty(glob('~/.vim/autoload/plug.vim'))
		silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
					\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
		autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
	endif
endif

if has('nvim')
	call plug#begin('~/.local/share/nvim/plugged')
else
	call plug#begin('~/.vim/plugged')
endif

Plug 'embear/vim-localvimrc'
Plug 'godlygeek/tabular', { 'on': 'Tabularize' }
Plug 'iCyMind/NeoSolarized'
Plug 'itchyny/lightline.vim'
Plug 'maxbrunsfeld/vim-yankstack'
Plug 'mesonbuild/meson', { 'rtp': 'data/syntax-highlighting/vim' }
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeToggle', 'NERDTreeFind', 'NERDTreeCWD', 'NERDTreeMirror'] }
Plug 'sjl/gundo.vim', { 'on': 'GundoToggle' }
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-git'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'wincent/command-t', { 'do': 'cd ruby/command-t/ext/command-t && make clean; ruby extconf.rb && make' }
Plug 'wincent/loupe'
Plug 'Xuyuanp/nerdtree-git-plugin', { 'on': ['NERDTreeToggle', 'NERDTreeFind', 'NERDTreeCWD', 'NERDTreeMirror'] }

call plug#end()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Settings
"

" set <leader> *before* any mappings
"
let mapleader = "\<Space>"

" ignore case sensitivity on search UNLESS using capital letters
"
set ignorecase
set smartcase

" show (and set) invisible characters
"
let &showbreak='↪ '
set listchars=tab:│\ ,trail:•,extends:»,precedes:«,nbsp:⦸
set list
set breakindent

" show the line and column number of the cursor position
"
set ruler

" show the relative line number in front of each line
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

" don't use tabs for Meson
autocmd Filetype meson setlocal expandtab

" do not wrap lines (but when we do, don't split words)
"
set nowrap
set linebreak

" do not resize windows after splitting/closing a window
"
set noequalalways

" use the mouse
"
set mouse=a

" highlight the current line
"
set cursorline


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Fugitive mappings and settings
"
nnoremap <leader>gs :Git<CR>
nnoremap <leader>gr :Gread<CR>
nnoremap <leader>gw :Gwrite<CR>
nnoremap <leader>ge :Gedit<CR>
nnoremap <leader>gd :Gdiff<CR>
nnoremap <leader>gc :Gcommit<CR>
nnoremap <leader>gl :0Gclog<CR>
nnoremap <leader>gb :Git blame<CR>
nnoremap <leader>gp :Git push<CR>

" Autoclose fugitive buffers when they go inactive
"
autocmd BufReadPost fugitive://* set bufhidden=delete


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Gundo mappings and settings
"
nnoremap <silent> <leader>u :GundoToggle<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Nerd Tree mappings and settings
"
nnoremap <silent> <leader>nn :NERDTreeToggle<CR>
nnoremap <silent> <leader>nf :NERDTreeFind<CR>
nnoremap <silent> <leader>nc :NERDTreeCWD<CR>
nnoremap <silent> <leader>nm :NERDTreeMirror<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Nerd Commenter mappings and settings
"
let g:NERDSpaceDelims = 1
let g:NERDTrimTrailingWhitespace = 1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" yankstack mappings and settings
"
let g:yankstack_map_keys = 0
nmap <silent> <leader>p <Plug>yankstack_substitute_older_paste
nmap <silent> <leader>P <Plug>yankstack_substitute_newer_paste
call yankstack#setup()

" make Y yank until the end of the line
" (this mapping must be *after* call yankstack#setup(), and needs recursion so don't use 'no')
"
nmap Y y$


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" localvimrc mappings and settings
"
let g:localvimrc_persistent = 1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Solarized mappings and settings
"
set background=dark
colorscheme NeoSolarized


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Lightline mappings and settings
"
let g:lightline = {
\	'colorscheme': 'powerline',
\	'active': {
\		'left': [
\			['mode', 'paste'],
\			['readonly', 'relativepath', 'modified'],
\		],
\		'right': [
\			['lineinfo'],
\			['gitbranch'],
\			['fileformat', 'fileencoding', 'filetype'],
\		],
\	},
\	'inactive': {
\		'left': [
\			['filename', 'modified'],
\		],
\		'right': [],
\	},
\	'component_function' : {
\		'gitbranch': 'fugitive#head',
\	},
\ }

" lightline will display the mode; don't show it twice
"
set noshowmode


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Mappings
"

" don't require holding shift to enter command/ex mode from normal/visual mode
"
nnoremap ; :
vnoremap ; :

" Open up vimrc
"
nnoremap <silent> <leader>v<leader> :edit $MYVIMRC<CR>

" jump to last opened buffer
" (can also use ctrl+6 or ctrl+^)
"
nnoremap <silent> <leader><Tab> :e #<CR>

" remove trailing whitespace
"
nnoremap <silent> <leader>$ :call <SID>Preserve("%s/\\s\\+$//e")<CR>

" insert the data and time
"
inoremap <silent> <leader>d<leader> <C-R>=strftime("%c")<CR>

" move between splits easier
"
nnoremap <silent> <c-h> :wincmd h<CR>
nnoremap <silent> <c-j> :wincmd j<CR>
nnoremap <silent> <c-k> :wincmd k<CR>
nnoremap <silent> <c-l> :wincmd l<CR>

" create a new tab
"
nnoremap <silent> <leader>T :tabnew<CR>

" double left mouse click will visually select and highlight/search word under cursor
" (from https://stackoverflow.com/questions/6876850/how-to-highlight-all-occurrences-of-a-word-in-vim-on-double-clicking)
"
nnoremap <silent> <2-LeftMouse> :let @/='\V\<'.escape(expand('<cword>'), '\').'\>'<CR>:set hlsearch<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Functions
"
function! <SID>Preserve(command)
	" Preparation: save last search, and cursor position.
	let _s=@/
	let l = line(".")
	let c = col(".")
	" Do the business:
	execute a:command
	" Clean up: restore previous search history, and cursor position
	let @/=_s
	call cursor(l, c)
endfunction
