scriptencoding utf-8
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
    Plugin 'derekwyatt/vim-scala'
    Plugin 'kien/ctrlp.vim'
    Plugin 'scrooloose/syntastic'
    Plugin 'sjl/badwolf'
    Plugin 'tpope/vim-fugitive'
    Plugin 'tpope/vim-sensible'
    Plugin 'VundleVim/Vundle.vim'
call vundle#end()

" set leader to comma (,)
let mapleader=","

" Turn off mouse, allow toggling with leader-m
set mouse=
function ToggleMouse()
    if &mouse == ""
        let &mouse = 'a'
        echo "mouse enabled"
    else
        let &mouse = ""
        echo "mouse disabled"
    endif
endfunction
noremap <Leader>m :call ToggleMouse()<cr>

" Turn on syntax highlighting and filetype specific things
syntax on
filetype plugin indent on

" Basic editor appearance
colorscheme badwolf
set nu
set ruler
set colorcolumn=+1
set textwidth=80
set showcmd

" Invisible Chars
set list
set listchars=tab:»\ ,eol:↵,space:·

" 4 space tabs
set tabstop=8 
set softtabstop=0 
set expandtab 
set shiftwidth=4 
set smarttab

" Modeline
set modeline
set modelines=5

