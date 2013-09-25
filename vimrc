"" Vundle
set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle
call vundle#rc()

" Let Vundle manage Vundle
Bundle 'gmarik/vundle'

" Bundles
Bundle 'natduca/quickopen'
Bundle 'scrooloose/nerdcommenter'
Bundle 'Valloric/YouCompleteMe'

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

"" Plugin Settings
