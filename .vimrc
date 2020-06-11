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

set makeprg=make\ -f\ ~/makefile\ %<\ EXTRA_CFLAGS=-fcolor-diagnostic
noremap <F5> :make<CR>
" Run with input
autocmd FileType c,cpp noremap <buffer> <F6> :!time timeout 5s ./%< <in<CR>
autocmd FileType python noremap <buffer> <F6> :!time timeout 5s python % <in<CR>
" Run without input
autocmd FileType c,cpp noremap <buffer> <F7> :!./%< <CR>
autocmd FileType python noremap <buffer> <F7> :!python % <CR>
" Optimized compilation
noremap <F8> :!clang++ -std=c++17 -Ofast -march=native % -o %<<CR>

" Save using \s
noremap <Leader>s :update<CR>
noremap <Leader>f :NERDTreeToggle<CR>

" Plugins to make life easy (vim-plug)
call plug#begin('~/.vim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'preservim/nerdtree'
Plug 'morhetz/gruvbox'
call plug#end()

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'

" Theme: gruvbox
set t_Co=256
let g:gruvbox_italic=1
set background=dark
colorscheme gruvbox

" Formatting
 function! Formatonsave()
 	let l:formatdiff = 1
 	pyf /usr/share/clang/clang-format.py
 endfunction
 autocmd InsertLeave *.h,*.cc,*.cpp,*.cxx,*.hpp call Formatonsave()

set clipboard=unnamedplus
