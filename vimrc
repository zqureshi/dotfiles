" Load vim-plug
if empty(glob("~/.vim/autoload/plug.vim"))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
      \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

call plug#begin('~/.vim/bundle')

" Plugins
Plug 'bling/vim-bufferline'
Plug 'junegunn/fzf',
  \ { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'rstacruz/sparkup',
  \ { 'for': 'html' }
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-surround'
Plug 'Valloric/YouCompleteMe',
  \ { 'do': './install.py' }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

call plug#end()

"" General
set nocompatible        " Get out of vi compatibility mode
set encoding=utf-8      " Explicitly set encoding to Unicode
set nobackup            " Disable backup files
set ruler               " Display the ruler
set showcmd             " Display the current incomplete command
set incsearch           " Enable incremental search
set ignorecase          " Ignore case when using a search pattern
set smartcase           " Overrise 'ignorecase' for uppercase patterns
set wildmenu            " Enable command-line completion
set pastetoggle=<F12>   " Make F12 toggle paste mode
set nonumber            " Do not show line numbers in margin
colorscheme molokai     " User the 'molokai' theme
set grepprg=grep\ -nH\ $* " Make grep always generate a file name
set backspace=indent,eol,start " Allow backspace over everything

"" Tabs and Spaces
set expandtab           " Expand tabs to spaces
set shiftwidth=2        " Use 2 spaces for indentation
set softtabstop=2       " Number of spaces to inser for a tab
set tabstop=2           " Number of spaces a tab in the text stands for
set autoindent          " Keep indentation from last line
set smartindent         " Do clever autoindenting

"" Code Editing
syntax enable           " Enable syntax highlighting
filetype plugin on      " Enable file specific plugins
filetype indent on      " Enable type specific indentation
set formatoptions+=ro   " Continue comment on next line
set foldlevel=100       " Keep all folds open by default

"" Key Mappings

" Use tab to change buffers
noremap <silent> <Tab> :bnext!<CR>
noremap <silent> <S-Tab> :bprev!<CR>

" Navigate splits easily
noremap <silent> <C-l> <C-w>l
noremap <silent> <C-h> <C-w>h

" Delete current buffer without closing split
noremap <silent> ,c :bprev <bar> :bdel #<CR>

" Quickly edit vimrc, zshrc
noremap <silent> ,v :e $MYVIMRC<CR>
noremap <silent> ,z :e $HOME/.zshrc<CR>

"" FileType specific settings

" Treat .ss and .rkt files as lisp
autocmd BufNewFile,BufRead *.ss,*.rkt set filetype=lisp

"Enable 'Rainbow Paranthesis' for lisp files
autocmd FileType lisp runtime plugin/RainbowParanthesis.vim

" Keep tabs in a makefile
autocmd FileType make setlocal noexpandtab

" Enable specific indetation for C code
autocmd FileType c setlocal cindent

" Disable smartindent for python since it doesn't work well with comments
autocmd FileType python setlocal nosmartindent

"" Commands

" Quickopen style shortcut for FZF
command O :FZF

"" Plugin Settings

" VIM Airline
set laststatus=2        " Always display the status line
set ttimeoutlen=50      " Quickly update on leaving insert mode
let g:bufferline_echo=0 " Only show buffers in status line
let g:airline_theme='badwolf'  " Use a theme in contrast with molokai
