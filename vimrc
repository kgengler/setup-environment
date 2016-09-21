set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.config/nvim/bundle/Vundle.vim

call vundle#begin()

	Plugin 'kien/ctrlp.vim'
	Plugin 'scrooloose/syntastic'
	Plugin 'sjl/badwolf'
	Plugin 'tpope/vim-fugitive'
	Plugin 'tpope/vim-sensible'
	Plugin 'VundleVim/Vundle.vim'

call vundle#end()

syntax on
filetype plugin indent on
colorscheme badwolf
set nu

" Modeline
set modeline
set modelines=5

" 4 space tabs
set tabstop=4
set shiftwidth=4
set expandtab

