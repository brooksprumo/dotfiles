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
