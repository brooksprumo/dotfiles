call plug#begin('~/.local/share/nvim/plugged')

Plug 'autozimu/LanguageClient-neovim', { 'branch': 'next', 'do': 'bash install.sh' }
Plug 'embear/vim-localvimrc'
Plug 'godlygeek/tabular'
Plug 'iCyMind/NeoSolarized'
Plug 'maxbrunsfeld/vim-yankstack'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'Shougo/denite.nvim'
Plug 'Shougo/deoplete.nvim'
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

call plug#end()
