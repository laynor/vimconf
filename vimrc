set nocompatible " vim, not vi
syntax on " syntax highlight
set hidden " behave like emacs with multiple buffers
set number

""" Autoindent
set autoindent
set copyindent
set smartindent


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
Bundle 'The-NERD-tree'
Bundle 'molokai'
Bundle 'The-NERD-Commenter'
Bundle 'surround.vim'
Bundle 'SWIG-syntax'
Bundle 'luarefvim'
Bundle 'lua.vim'
" Bundle 'OmniCppComplete'

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

""" META/ESC issue
"let c='a'
"while c <= 'z'
"  exec "set <A-".c.">=\e".c
"  exec "imap \e".c." <A-".c.">"
"  let c = nr2char(1+char2nr(c))
"endw
"
"set timeout ttimeoutlen=50

""" TAB AS SPACES
set expandtab
set shiftwidth=4

let g:inkpot_black_background=1
colorscheme inkpot
nmap du :wincmd w<cr>:normal u<cr>:wincmd w<cr>

""" FuzzyFinder
noremap <C-X><C-F> :FufFile<CR>
noremap! <C-G> <C-c>

""" NERDTree
nmap <C-D> :NERDTreeToggle<CR>

""" NERDCommenter
vmap <leader>; <Plug>NERDCommenterToggle
vmap <M-;> <Plug>NERDCommenterToggle

if has("unix") && !has("gui_running")
    set <M-;>=;
endif
""" Taglist
autocmd BufWritePost *.c :TlistUpdate
autocmd BufWritePost *.cpp :TlistUpdate
autocmd BufWritePost *.h :TlistUpdate

"""" Wild
set wildmenu
set ignorecase
set smartcase

""" search
set hlsearch
set incsearch

""" parenmatch
set showmatch

""" scrolling
set scrolloff=4

""" Trailing whitespace

fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun

autocmd FileType c,cpp,java,php,ruby,python,vim autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()
autocmd BufNewFile,BufRead *.i set filetype=swig
