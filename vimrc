call pathogen#helptags()
call pathogen#runtime_append_all_bundles()

" remap leader from \ to ,
let mapleader = ","

" make regex behave like perl/python without vi specialness
nnoremap / /\v
vnoremap / /\v

" slightly saner search settings
set ignorecase
set smartcase
set incsearch
set showmatch
set hlsearch
nnoremap <leader><space> :noh<cr>

" set line numbers on
set number

set shiftwidth=4
set tabstop=4
set expandtab
" will work on vim >= 7.3
"set colorcolumn=80

set encoding=utf-8

" autosave on focus lost
au FocusLost * :wa

" comment a line and descend
nnoremap <leader>c 0i#<ESC>j
" uncomment a line and descend
nnoremap <leader>u 0xj

" split vertically, change to the window
nnoremap <leader>w <C-w><C-v><C-l>

" makes Ack easier to get to
nnoremap <leader>a :Ack

if has("gui_running")
    colorscheme solarized
else
    set t_Co=256
    colorscheme calmar256-dark
"    colorscheme calmar256-light
"    colorscheme textmate16
endif
