" Christian's NeoVim Config!
" --------------------------
"
" ---- Plugins ----
call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')
Plug 'Yggdroot/LeaderF', { 'do': ':LeaderfInstallCExtension' }
Plug 'https://github.com/preservim/nerdtree.git'
"Autocomplete Plugins"
Plug 'davidhalter/jedi-vim'
Plug 'Townk/vim-autoclose'
"Visuals"
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }
"From GitHub - always load the vim-devicons as the very last one.
Plug 'ryanoasis/vim-devicons'
call plug#end()

"---- Line Visuals ----
set number
set relativenumber

"---- Visual Alignment ----
set tabstop=4
set softtabstop=4

"---- Input Options ----
set mouse=a

"---- Text Options ----
set encoding=UTF-8
let g:webdevicons_enable_nerdtree = 1

"---- NERDTree ----
" Start NERDTree and put the cursor back in the other window.

" Automatically close NerdTree if it's the last window open
autocmd VimEnter * NERDTree | wincmd p

"---- Hexokinase ----
let g:Hexokinase_highlighters = ['foreground']

"---- Airline----"
let g:airline_theme='bubblegum'
