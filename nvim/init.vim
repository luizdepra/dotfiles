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

" General configs

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

" Visual
syntax on
set ruler
set number

silent! colorscheme gruvbox