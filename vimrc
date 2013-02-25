set nocompatible " vim, not vi
syntax on " syntax highlight
set hidden " behave like emacs with multiple buffers
set number

""" Autoindent
set autoindent
set copyindent


""" Vundle
filetype off " required for vundle
set rtp+=~/.vim/bundle/vundle
call vundle#rc()
Bundle 'gmarik/vundle'
Bundle 'Vimacs'
Bundle 'Gundo'
Bundle 'inkpot'

" Include my bundles here

filetype plugin indent on
" powerline
set rtp+=~/.local/lib/python3.3/site-packages/powerline/bindings/vim
set laststatus=2
nmap du :wincmd w<cr>:normal u<cr>:wincmd w<cr>
