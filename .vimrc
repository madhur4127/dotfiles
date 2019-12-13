set nocompatible " be iMproved, required
filetype detect  " required
syntax on
set tabstop=4
set shiftwidth=4
set tabstop=4
set shiftwidth=4
set nowrap
set autowrite
set number relativenumber
set autoindent

" Compiling C++
set makeprg=make\ -f\ ~/makefile\ %<
noremap <F5> :make<CR>
noremap <F6> :!time timeout 5s ./%< < in<CR>
noremap <F7> :!./%< <CR>
nnoremap <F9> :cnext<CR>
nnoremap <F10> :cprev<CR>
