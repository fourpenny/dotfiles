" Christian's NeoVim Config!
" --------------------------
"
" ---- Plugins ----
call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')
Plug 'Yggdroot/LeaderF', { 'do': ':LeaderfInstallCExtension' }
Plug 'https://github.com/preservim/nerdtree.git'
call plug#end()

"---- Visual Alignment ----
set tabstop=4
set softtabstop=4

"---- Input Options ----
set mouse=a

"---- NERDTree ----
" Start NERDTree and put the cursor back in the other window.
autocmd VimEnter * NERDTree | wincmd p
