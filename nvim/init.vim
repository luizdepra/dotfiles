"-- Plugin installation

" Check Plug installation
let vimplug_exists=expand('~/.config/nvim/autoload/plug.vim')

if !filereadable(vimplug_exists)
  if !executable("curl")
    echoerr "You have to install curl or first install vim-plug yourself!"
    execute "q!"
  endif
  echo "Installing Vim-Plug..."
  echo ""
  silent exec "!\curl -fLo " . vimplug_exists . " --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
  let g:not_finish_vimplug = "yes"

  autocmd VimEnter * PlugInstall
endif

" Starts Plug
call plug#begin(expand('~/.config/nvim/plugged'))

Plug 'airblade/vim-gitgutter'
Plug 'dense-analysis/ale'
Plug 'sheerun/vim-polyglot'

" Theme
Plug 'morhetz/gruvbox'

call plug#end()

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

" Enable hidden buffers
set hidden

" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

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

"-- Plugins

" Ale
let g:ale_enabled = 1
let b:ale_fixers = {
\   'python': ['black', 'isort']
\}
let g:ale_fix_on_save = 0

"-- Commands

" remove trailing whitespaces
command! FixWhitespace :%s/\s\+$//e

"-- Mappings

" Center search
nnoremap n nzzzv
nnoremap N Nzzzv

