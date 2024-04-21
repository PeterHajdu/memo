call plug#begin()
Plug 'tyru/eskk.vim'
Plug 'ctrlpvim/ctrlp.vim'
call plug#end()

set nocompatible
filetype off
filetype plugin indent on
" General settings

let mapleader=","
set backspace=indent,eol,start
set ruler
set number
set showcmd
set incsearch
set hlsearch
set ignorecase
set smartcase

" Indentation
set expandtab
set shiftwidth=2
set tabstop=2

" look and feel
set background=dark
set colorcolumn=70

" always show statusline
set laststatus=2

syntax on

set nobackup
set nowritebackup
set noswapfile
set noundofile

" forget about arrows
inoremap  <Up>     <NOP>
inoremap  <Down>   <NOP>
inoremap  <Left>   <NOP>
inoremap  <Right>  <NOP>
noremap   <Up>     <NOP>
noremap   <Down>   <NOP>
noremap   <Left>   <NOP>
noremap   <Right>  <NOP>

" easy tab navigation
map <C-e> <ESC>:tabnew 

" split pane navigation
nmap <silent> <C-k> :wincmd k<CR>
nmap <silent> <C-j> :wincmd j<CR>
nmap <silent> <C-h> :wincmd h<CR>
nmap <silent> <C-l> :wincmd l<CR>

" show insane characters
set lcs=tab:>-,trail:-
set list
