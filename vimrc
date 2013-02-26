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
Bundle 'taglist.vim'
Bundle 'L9'
Bundle 'FuzzyFinder'

" Include my bundles here
set rtp+=~/.vim/after

filetype plugin indent on
" powerline
let s:host = hostname()
if s:host == 'pignegna'
	set rtp+=~/.local/lib/python3.3/site-packages/powerline/bindings/vim
elseif s:host == 'shark.tekno-soft.it'
	set rtp+=/home/alessandro/.local/lib/python2.7/site-packages/powerline/bindings/vim
endif

set laststatus=2


nmap du :wincmd w<cr>:normal u<cr>:wincmd w<cr>
noremap <C-X><C-F> :FufFile<CR>
noremap! <C-G> <C-c>
autocmd BufWritePost *.c :TlistUpdate
autocmd BufWritePost *.cpp :TlistUpdate
autocmd BufWritePost *.h :TlistUpdate

