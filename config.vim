scriptencoding utf-8
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
    Plugin 'VundleVim/Vundle.vim'
    Plugin 'chase/vim-ansible-yaml'
    Plugin 'derekwyatt/vim-scala'
    Plugin 'ervandew/supertab'
    Plugin 'godlygeek/tabular'
    Plugin 'kien/ctrlp.vim'
    Plugin 'lilydjwg/colorizer'
    Plugin 'plasticboy/vim-markdown'
    Plugin 'racer-rust/vim-racer'
    Plugin 'rkulla/pydiction'
    Plugin 'rust-lang/rust.vim'
    Plugin 'scrooloose/syntastic'
    Plugin 'sjl/badwolf'
    Plugin 'tpope/vim-fugitive'
    Plugin 'tpope/vim-sensible'
    Plugin 'tpope/vim-surround'
call vundle#end()

" Turn on syntax highlighting and filetype specific things
syntax on
filetype plugin indent on

" Basic editor appearance
colorscheme badwolf
set colorcolumn=+1
set nu
set ruler
set showcmd
set textwidth=80

" 4 space tabs
set expandtab
set shiftwidth=4
set smarttab
set softtabstop=0
set tabstop=8

" Modeline
set modeline
set modelines=5

" pydiction configuration
let g:pydiction_location = $HOME . '/.vim/bundle/pydiction/complete-dict'
let g:pydiction_menu_height = 3

" Ruby Configuration
autocmd FileType ruby setlocal shiftwidth=2

" Rust Configuration
let g:rustfmt_autosave = 1
let g:racer_cmd = $HOME . '/.cargo/bin/racer'

" markdown settings
let g:vim_markdown_folding_disabled = 1
au BufRead *.md setlocal spell

" Ctrl P settings
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

" set leader to comma (,)
let mapleader=','

" Remove trailing spaces
noremap <Leader>t :%s/\s\+$//e<cr>

" Copy visual block to system clipboard
noremap <Leader>y "*y<cr>

" Paste contents of system clipboard
noremap <Leader>p "*p<cr>

" Turn off mouse, allow toggling with leader-m
set mouse=
function ToggleMouse()
    if &mouse == ''
        let &mouse = 'a'
        echo 'mouse enabled'
    else
        let &mouse = ''
        echo 'mouse disabled'
    endif
endfunction
noremap <Leader>m :call ToggleMouse()<cr>

" Search Ctags
noremap <leader>. :CtrlPTag<cr>

" Neovim specific features
if has('nvim')
    " Invisible Chars
    set list
    set listchars=tab:»\ ,eol:↵,space:·

    " show the regex preview Requires >= 0.1.7 - :help icm
    set inccommand=split
endif

