"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Nvim Mappings
"

" don't require holding shift to enter command/ex mode from normal/visual mode
"
nnoremap ; :
vnoremap ; :

" jump to last opened buffer
" (can also use ctrl+6 or ctrl+^)
"
nnoremap <silent> <leader><Tab> :e #<CR>

" remove trailing whitespace
"
nnoremap <silent> <leader>$ :call <SID>Preserve("%s/\\s\\+$//e")<CR>

" toggle show/hide hidden characters
"
nnoremap <F9>      :set list!<CR>
inoremap <F9> <ESC>:set list!<CR>i

" insert the data and time
"
inoremap <leader>d<leader> <C-R>=strftime("%c")<CR>

" move between splits easier
"
nnoremap <silent> <c-h> :wincmd h<CR>
nnoremap <silent> <c-j> :wincmd j<CR>
nnoremap <silent> <c-k> :wincmd k<CR>
nnoremap <silent> <c-l> :wincmd l<CR>

" make Y yank until the end of the line
" (this mapping must be *after* call yankstack#setup(), and needs recursion so don't use 'no')
"
nmap Y y$

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
