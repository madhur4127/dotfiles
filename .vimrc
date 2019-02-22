set mouse=a
set nocompatible              " be iMproved, required
syntax on
filetype detect                  " required
set tabstop=4
set shiftwidth=4
set tabstop=4
set shiftwidth=4
set nowrap
set autowrite
set number relativenumber
set autoindent

" Theme
set termguicolors
set background=dark
let g:gruvbox_contrast_dark='hard'
let g:gruvbox_italicize_comments='1'
let g:gruvbox_italicize_strings='1'
let g:gruvbox_italic='1'
let g:gruvbox_bold='1'
let g:gruvbox_improved_warnings='1'
colorscheme gruvbox


" Plugins 
call plug#begin('~/.vim/plugged')
" Declare the list of plugins.
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
let g:airline_powerline_fonts = 1
set laststatus=2
set ttimeoutlen=50
let g:airline_theme='simple'
let g:airline#extensions#tabline#enabled = 1
" List ends here. Plugins become visible to Vim after this call.
call plug#end()

set makeprg=make\ -f\ ~/makefile\ %<
noremap <F5> :make<CR>
noremap <F6> :!/usr/bin/time -f "\nExecution Time: \%es (system: \%Ss)" timeout 5s ./%< < ip.txt<CR>
noremap <F7> :!./%< <CR>
nnoremap <F9> :cnext<CR>
nnoremap <F10> :cprev<CR>
map <C-K> :py3file /usr/share/clang/clang-format-6.0/clang-format.py<cr>
set clipboard=unnamed,unnamedplus
