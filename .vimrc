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

" Cycling through errors
nnoremap <F9> :cnext<CR>
nnoremap <F10> :cprev<CR>

" Run with input
autocmd FileType c,cpp noremap <buffer> <F6> :!time timeout 5s ./%< <in<CR>
autocmd FileType python noremap <buffer> <F6> :!time timeout 5s python % <in<CR>

" Run without input
autocmd FileType c,cpp noremap <buffer> <F7> :!./%< <CR>
autocmd FileType python noremap <buffer> <F7> :!python % <CR>

" Save using \s
noremap <Leader>s :update<CR>

" Plugins to make life easy (vim-plug)
call plug#begin('~/.vim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'ycm-core/YouCompleteMe'
Plug 'preservim/nerdtree'
Plug 'morhetz/gruvbox'

call plug#end()

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:ycm_warning_symbol = '⚠'
let g:ycm_error_symbol = '☢️'
let g:ycm_global_ycm_extra_conf = '$HOME/.ycm_extra_conf.py'
let g:ycm_always_populate_location_list = 1

" Theme: gruvbox
set t_Co=256
let g:gruvbox_italic=1
set background=dark
colorscheme gruvbox

" Using: vim-cpp-enhanced-highlight
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_experimental_template_highlight = 1

" Formatting
function! Formatonsave()
	let l:formatdiff = 1
	YcmCompleter Format
endfunction
autocmd InsertLeave *.h,*.cc,*.cpp,*.cxx,*.hpp call Formatonsave()
