set nocompatible " be iMproved, required
filetype detect  " required
syntax on
set tabstop=4  "number of spaces a <Tab> in the text stands for
set shiftwidth=4 "number of spaces used for each step of (auto)indent
set softtabstop=4  "if non-zero, number of spaces to insert for a <Tab>
set noexpandtab
set nosmarttab "a <Tab> in an indent inserts 'shiftwidth' spaces

set nowrap
set number relativenumber
filetype plugin indent on

" Compiling C++
set makeprg=make\ -f\ ~/makefile\ %<
noremap <F5> :make<CR>
noremap <F6> :!time timeout 5s ./%< < in<CR>

" Cycling through errors
nnoremap <F9> :cnext<CR>
nnoremap <F10> :cprev<CR>

" Run 
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
autocmd BufWritePre *.h,*.cc,*.cpp call Formatonsave()

" Save using \s
noremap <Leader>s :update<CR>
