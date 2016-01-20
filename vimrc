call pathogen#helptags()
call pathogen#runtime_append_all_bundles()

" set fonts
set guifont=Ubuntu\ Mono\ 14

" don't try vim compatibility
set nocompatible

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

" set spell-check highlighting on
" use ]s [s to go to next/previous world
" z= to get suggestions
" zg to add word under the cursor to the dictionary
set spell

" set line numbers on
set number
" set relative line numbers on
" set relativenumber

" soft wrap
set wrap
set linebreak
set nolist " list disables linebreak

set formatoptions=1
set lbr

set shiftwidth=4
set tabstop=4
set expandtab
" will work on vim >= 7.3
set colorcolumn=80


set encoding=utf-8

" autosave on focus lost
au FocusLost * :wa

" comment a line and descend
nnoremap <leader>c 0i#<ESC>j
" uncomment a line and descend
nnoremap <leader>u 0xj

" split vertically, change to the window
nnoremap <leader>w <C-w><C-v><C-l>

" NERDTree handy shortcuts
" For the docs:
" https://github.com/scrooloose/nerdtree/blob/master/doc/NERD_tree.txt
nnoremap <leader>nt :NERDTreeToggle<CR>
nnoremap <leader>nc :NERDTreeClose<CR>
nnoremap <leader>nf :NERDTreeFind<CR>

" makes nav around windows easier.
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" makes Ack easier to get to
nnoremap <leader>a :Ack

" map to aspell "
nnoremap <leader>s :w!<CR>:!aspell check %<CR>:e! %<CR>

if has("gui_running")
"    colorscheme solarized
    colorscheme distinguished
else
    set t_Co=256
    colorscheme distinguished
endif

nnoremap <leader>1 :colorscheme molokai<CR>
nnoremap <leader>2 :colorscheme calmar256-dark<CR>
nnoremap <leader>3 :colorscheme calmar256-light<CR>
nnoremap <leader>4 :colorscheme solarized<CR>
nnoremap <leader>5 :colorscheme grb256<CR>
nnoremap <leader>6 :colorscheme distinguished<CR>

" switch light and dark
nnoremap <leader>[ :set background=light<CR>
nnoremap <leader>] :set background=dark<CR>

" auto-reload changed files
set autoread

" tab command shortcuts
nnoremap th :tabfirst<CR>
nnoremap tk :tabnext<CR>
nnoremap tj :tabprev<CR>
nnoremap tl :tablast<CR>
nnoremap te :tabedit<Space>

" scrolling modes - 'typewriter scrolling'
nnoremap zm :set scrolloff=999<CR>
nnoremap zx :set scrolloff=0<CR>
"good for coding
nnoremap zp :set scrolloff=10<CR>
" let's default to a little scrolloff
set scrolloff=10

filetype plugin on
filetype indent on
au FileType python set autoindent
au FileType python set smartindent
au FileType python set textwidth=79 "PEP8 friendly
au FileType python set scrolloff=5 "modest typewriter mode
au FileType python set shiftwidth=4
au FileType python set tabstop=4
au FileType python set expandtab

au FileType rst set autoindent
au FileType rst set smartindent
au FileType rst set textwidth=79 "PEP8 friendly
au FileType rst set scrolloff=5 "modest typewriter mode
au FileType rst set shiftwidth=4
au FileType rst set tabstop=4
au FileType rst set expandtab

au BufNewFile,BufRead *.yaml,*.yml so ~/.vim/syntax/yaml.vim
au FileType yaml set autoindent
au FileType yaml set smartindent
au FileType yaml set shiftwidth=2
au FileType yaml set tabstop=2
au FileType yaml set expandtab

" disable auto-indenting
nnoremap <leader>ni :setl noai nocin nosi inde=<CR>

" show file encoding detected when the status bar shows
if has("statusline")
     set statusline=%<%f\ %h%m%r%=%{\"[\".(&fenc==\"\"?&enc:&fenc).((exists(\"+bomb\")\ &&\ &bomb)?\",B\":\"\").\"]\ \"}%k\ %-14.(%l,%c%V%)\ %P
 endif
" always show the status bar
set laststatus=2
" make it possible to switch status
nnoremap <leader>ss :set laststatus=2<CR>
nnoremap <leader>hs :set laststatus=1<CR>

" re-formatting of a paragraph
nnoremap <leader>r gqip

" Disable quote concealing by the JSON plugin which can be a bit confusing
let g:vim_json_syntax_conceal = 0

" ignore certain file patterns in, e.g., CommandT
set wildignore=*\.pyc
" ditto in Nerd Tree
let NERDTreeIgnore = ['\.pyc$']

" CTRL-P
set runtimepath^=~/.vim/bundle/ctrlp.vim
" ctrlp
nnoremap <leader>t :CtrlP<CR>
nnoremap <leader>b :CtrlPBuffer<cr>
nnoremap <leader>m :CtrlPMRU<cr>
"
let g:ctrlp_match_window_reversed = 0
"let g:ctrlp_max_height = 30
"
"let g:ctrlp_max_files = 10000
"
"let g:ctrlp_prompt_mappings = {
"  \  'AcceptSelection("t")': ['<cr>'],
"  \  'AcceptSelection("e")': ['<2-LeftMouse>'],
"  \ }
"
"if has("unix")
"    let g:ctrlp_user_command = {
"    \ 'types': {
"        \ 1: ['.git/', 'cd %s && git ls-files']
"        \ },
"    \ 'fallback': 'find %s -type f | head -' . g:ctrlp_max_files
"    \ }
"endif
"
"" let g:ctrlp_clear_cache_on_exit = 0
"" let g:ctrlp_cache_dir = $HOME . '/.vim/.cache/ctrlp'
"
"
" FixWhitespace shortcut
nnoremap <leader>f :FixWhitespace<CR>

" Flake8 customisations
let g:flake8_show_in_gutter=1  " show
