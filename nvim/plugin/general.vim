"-- General configs

" Default shell
if exists('$SHELL')
  set shell=$SHELL
else
  set shell=/bin/sh
endif

" Map leader to ,
let mapleader=','

" File detection
filetype plugin indent on

" File format
set fileformats=unix,dos,mac

" Encoding
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8

" Fix backspace indent
set backspace=indent,eol,start

" Tabs
set tabstop=4
set softtabstop=0
set shiftwidth=4
set expandtab

" Reload files when changed outside vim
set autoread

" Enable hidden buffers
set hidden

" Command history size
set history=100

" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

let loaded_matchparen = 1

" Gotta Go Fast
set ttyfast

"-- Visual

" Editor
syntax on
set ruler
set number
set relativenumber

" Scroll
set scrolloff=4

" Statusbar
set laststatus=2
set noshowmode

" File modeline
set modeline
set modelines=10

" Title
set title
set titleold="Terminal"
set titlestring=%F

" Whitespaces
set list lcs=trail:•,tab:»•,nbsp:•,eol:¬

" Line highlighting
set cursorline
highlight clear CursorLine
highlight CursorLineNR ctermbg=red

" Theme
silent! colorscheme gruvbox
let g:gruvbox_contrast_dark='medium'
set background=dark
