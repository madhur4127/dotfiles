set mouse=a
set nocompatible              " be iMproved, required
filetype detect                  " required
set tabstop=4
set shiftwidth=4
set tabstop=4
set shiftwidth=4
set nowrap
set autowrite
" Theme
set termguicolors
syntax on
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
let g:ycm_autoclose_preview_window_after_completion = 1


let g:airline_powerline_fonts = 1
set laststatus=2
set ttimeoutlen=50

let g:airline_theme='simple'
let g:airline#extensions#tabline#enabled = 1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

set number relativenumber

" List ends here. Plugins become visible to Vim after this call.
call plug#end()
let g:ycm_global_ycm_extra_conf = '~/.vim/plugged/youcompleteme/.ycm_extra_conf.py'

set makeprg=make\ -f\ ~/makefile\ %<
noremap <F5> :make<CR>
noremap <F6> :!./%< < ./ip.txt<CR>
nnoremap <F9> :cnext<CR>
nnoremap <F10> :cprev<CR>
noremap <Leader>s :update<CR>
map <C-K> :py3file /usr/share/clang/clang-format-6.0/clang-format.py<cr>
set ttymouse=xterm2
set clipboard=unnamed,unnamedplus
