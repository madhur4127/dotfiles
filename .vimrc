set nocompatible " be iMproved, required
filetype detect  " required
syntax on
set tabstop=4  "number of spaces a <Tab> in the text stands for
set shiftwidth=4 "number of spaces used for each step of (auto)indent
set softtabstop=4  "if non-zero, number of spaces to insert for a <Tab>
set noexpandtab
set nosmarttab "a <Tab> in an indent inserts 'shiftwidth' spaces
set autowrite

set nowrap
set number relativenumber
filetype plugin indent on

" Keymaps for compiling, testing, running
" F5: compile (C/C++)
" F6: Run with input "< in"
" F7: Run without input
" F8: Compile for optimizations using -O2

" Compiling C++
set makeprg=make\ -f\ ~/makefile\ %<\ EXTRA_CFLAGS=-fcolor-diagnostic
noremap <F5> :make<CR>
noremap <F8> :!clang++ -std=c++14 % -o %< -Ofast<CR>


" Cycling through errors
nnoremap <F9> :cnext<CR>
nnoremap <F10> :cprev<CR>

" Run with input
autocmd FileType c,cpp noremap <buffer> <F6> :!time timeout 5s ./%< <in<CR>
autocmd FileType python noremap <buffer> <F6> :!time timeout 5s python % <in<CR>

" Run without input
autocmd FileType c,cpp noremap <buffer> <F7> :!./%< <CR>
autocmd FileType python noremap <buffer> <F7> :!python % <CR>

" Clang Format
map <C-K> :pyf /usr/local/etc/clang-format.py<cr>
imap <C-K><c-o>:pyf /usr/local/etc/clang-format.py<cr>

" Formats the buffer before saving to the file
function! Formatonsave()
  let l:formatdiff = 1
  pyf /usr/local/etc/clang-format.py
endfunction
autocmd InsertLeave *.h,*.cc,*.cpp call Formatonsave()

" Save using \s
noremap <Leader>s :update<CR>
