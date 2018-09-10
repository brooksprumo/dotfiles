"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins
"

if has('nvim')
	if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
		silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
					\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
		autocmd VimEnter * PlugInstall
	endif
else
	if empty(glob('~/.vim/autoload/plug.vim'))
		silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
					\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
		autocmd VimEnter * PlugInstall
	endif
endif

if has('nvim')
	call plug#begin('~/.local/share/nvim/plugged')
else
	call plug#begin('~/.vim/plugged')
endif

Plug 'embear/vim-localvimrc'
Plug 'godlygeek/tabular'
Plug 'iCyMind/NeoSolarized'
Plug 'maxbrunsfeld/vim-yankstack'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'sjl/gundo.vim', { 'on': 'GundoToggle' }
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-git'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'wincent/command-t', { 'do': 'cd ruby/command-t/ext/command-t && make clean; ruby extconf.rb && make' }
Plug 'Xuyuanp/nerdtree-git-plugin'

if has('nvim')
	Plug 'autozimu/LanguageClient-neovim', { 'branch': 'next', 'do': 'bash install.sh' }
	Plug 'Shougo/denite.nvim'
	Plug 'Shougo/deoplete.nvim'
endif

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


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Fugitive mappings and settings
"
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gr :Gread<CR>
nnoremap <leader>gw :Gwrite<CR>
nnoremap <leader>ge :Gedit<CR>
nnoremap <leader>gd :Gdiff<CR>
nnoremap <leader>gc :Gcommit<CR>
nnoremap <leader>gl :Glog<CR>
nnoremap <leader>gb :Gblame<CR>
nnoremap <leader>gp :Gpush<CR>

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
" deoplete mappings and settings
"
let g:deoplete#enable_at_startup = 1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" LanguageClient mappings and settings
"
nnoremap <leader>ld :call LanguageClient#textDocument_definition()<CR>
nnoremap <leader>lr :call LanguageClient#textDocument_rename()<CR>
nnoremap <leader>lf :call LanguageClient#textDocument_formatting()<CR>
nnoremap <leader>lt :call LanguageClient#textDocument_typeDefinition()<CR>
nnoremap <leader>lx :call LanguageClient#textDocument_references()<CR>
nnoremap <leader>la :call LanguageClient_workspace_applyEdit()<CR>
nnoremap <leader>lc :call LanguageClient#textDocument_completion()<CR>
nnoremap <leader>lh :call LanguageClient#textDocument_hover()<CR>
nnoremap <leader>ls :call LanguageClient_textDocument_documentSymbol()<CR>
nnoremap <leader>lm :call LanguageClient_contextMenu()<CR>

let g:LanguageClient_serverCommands = {
	\ 'p': ['clangd'],
	\ 'c': ['clangd'],
	\ 'ec': ['clangd'],
	\ 'cpp': ['clangd'],
	\ }

" signcolumn will appear each time Clangd sends a warning or provides a diagnostic and the text will be shifted by one column each time signcolumn is triggered.  To prevent this shift and always show the signcolumn
"
set signcolumn=yes


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
" Airline mappings and settings
"
let g:airline_theme = 'badwolf'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#whitespace#mixed_indent_algo = 2
let g:airline#extensions#languageclient#enabled = 1

" the statusline will display the mode, so don't show it twice
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

" toggle show/hide hidden characters
"
nnoremap <silent> <F9>      :set list!<CR>
inoremap <silent> <F9> <ESC>:set list!<CR>i

" insert the data and time
"
inoremap <silent> <leader>d<leader> <C-R>=strftime("%c")<CR>

" move between splits easier
"
nnoremap <silent> <c-h> :wincmd h<CR>
nnoremap <silent> <c-j> :wincmd j<CR>
nnoremap <silent> <c-k> :wincmd k<CR>
nnoremap <silent> <c-l> :wincmd l<CR>

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
