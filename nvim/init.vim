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
Plug 'mfussenegger/nvim-dap'
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/nvim-treesitter-context', {'do': ':TSContextEnable'}
Plug 'p00f/godbolt.nvim',
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeToggle', 'NERDTreeFind', 'NERDTreeCWD', 'NERDTreeMirror'] }
Plug 'simrat39/rust-tools.nvim'
Plug 'sjl/gundo.vim', { 'on': 'GundoToggle' }
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-git'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'wincent/loupe'
Plug 'Xuyuanp/nerdtree-git-plugin', { 'on': ['NERDTreeToggle', 'NERDTreeFind', 'NERDTreeCWD', 'NERDTreeMirror'] }
Plug 'zchee/vim-flatbuffers'

" colorscheme plugins
Plug 'projekt0n/github-nvim-theme'
Plug 'NLKNguyen/papercolor-theme'
Plug 'sainnhe/sonokai'

call plug#end()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Configure LSP
"
lua <<EOF

-- function to attach completion when setting up lsp
local on_attach = function(client, bufnr)
	vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
end

-- Enable rust-tools
require('rust-tools').setup({
	server = {
		on_attach = on_attach,
	},
	tools = {
		hover_with_actions = false,
		inlay_hints = {
			highlight = "NonText"
		},
	},
})

-- Enable diagnostics
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
	vim.lsp.diagnostic.on_publish_diagnostics, {
		virtual_text = true,
		signs = true,
		update_in_insert = false,
	}
)

-- Hover doc popup
local pop_opts = { border = "rounded" }
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, pop_opts)
vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, pop_opts)

-- Configure Treesitter
require('nvim-treesitter.configs').setup {
	ensure_installed = "all", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
	indent = {
		enable = false,
	},
}

-- Configure Godbolt
require('godbolt').setup({
	languages = {
		rust = { compiler = "stable", options = {"-C opt-level=3"} },
    },
	quickfix = {
		enable = true,
		auto_open = false,
	},
})

EOF


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Settings
"

" set <leader> *before* any mappings
"
let mapleader = "\<Space>"

" Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
" If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
" (see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
    if (has("nvim"))
        "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
        let $NVIM_TUI_ENABLE_TRUE_COLOR=1
    endif
    " For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
    " Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
    " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
    if (has("termguicolors"))
        set termguicolors
    endif
endif

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

" Set completeopt to have a better completion experience
" menuone: popup even when there's only one match
" noinsert: Do not insert text until a selection is made
" noselect: Do not select, force user to select one from the menu
"
set completeopt=menuone,noinsert,noselect

" Avoid showing extra messages when using completion
"
set shortmess+=c

" have a fixed column for the diagnostics to appear in
"
set signcolumn=yes

" Set updatetime for CursorHold
"
set updatetime=333

" auto-format *.rs (rust) files prior to saving them
"
autocmd BufWritePre *.rs lua vim.lsp.buf.format()

" do not use tabs for Meson
"
autocmd Filetype meson setlocal expandtab

" Use Treesitter for folding
"
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Fugitive mappings and settings
"
nnoremap <leader>gs  :Git<CR>
nnoremap <leader>gr  :Gread<CR>
nnoremap <leader>gw  :Gwrite<CR>
nnoremap <leader>ge  :Gedit<CR>
nnoremap <leader>gdd :Gdiff<CR>
nnoremap <leader>gda :Gdiff !^<CR>
nnoremap <leader>gc  :Gcommit<CR>
nnoremap <leader>gl  :0Gclog<CR>
nnoremap <leader>gb  :Git blame<CR>
nnoremap <leader>gp  :Git push<CR>

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
" color mappings and settings
"
set background=dark
colorscheme sonokai


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
\			['lineinfo', 'percent'],
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
\		'gitbranch': 'FugitiveHead',
\	},
\ }

" lightline will display the mode; don't show it twice
"
set noshowmode


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Loupe mappings and settings
"
let g:LoupeClearHighlightMap = 1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Telescope mappings and settings
"
nnoremap <silent> <leader>tf :Telescope find_files<CR>
nnoremap <silent> <leader>tg :Telescope live_grep<CR>
nnoremap <silent> <leader>tb :Telescope buffers<CR>
nnoremap <silent> <leader>/  :Telescope current_buffer_fuzzy_find<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" LSP mappings
"
nnoremap <silent> <leader>ll <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> <leader>lL <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> <leader>lt <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> <leader>li <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> <leader>lk <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> <leader>lr <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> <leader>lR <cmd>lua vim.lsp.buf.rename()<CR>
nnoremap <silent> <leader>la <cmd>lua vim.lsp.buf.code_action()<CR>
nnoremap <silent> <leader>ld <cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>
nnoremap <silent> K          <cmd>lua vim.lsp.buf.hover()<CR>


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
"nnoremap <silent> <2-LeftMouse> :let @/='\V\<'.escape(expand('<cword>'), '\').'\>'<CR>:set hlsearch<CR>

" highlight all occurrences of a visual selection
"
vnoremap <silent> <leader>/ y:let @/='<C-R>0'<CR>:set hlsearch<CR>

" Use <Tab> and <S-Tab> to navigate through popup menu
"
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" use <Tab> as trigger keys for completion
"
"imap <Tab> <Plug>(completion_smart_tab)
"imap <S-Tab> <Plug>(completion_smart_s_tab)


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
