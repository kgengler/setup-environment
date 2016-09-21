#!/bin/bash

# see if we're on mac os or linux
case "$(uname)" in
    "Darwin")
        IS_MACOS="Yes"
    ;;
esac

# Set up homebrew and install packages if we're on mac os
if [ "$IS_MACOS" == "Yes" ]; then
    
    [[ -z "$(which brew)" ]] && /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    
    brew update && \
    brew install $(curl -Ls https://kylegengler.com/devenv/homebrew-packages.txt)
fi

# use current directory if $HOME isn't set
if [ -z "$HOME" ]; then
    $HOME=$(pwd)
fi


# Set up neovim
rm -rf "$HOME/.vim"
rm -f "$HOME/.vimrc"

mkdir -p "$HOME/.config/nvim"

if [ -f "$HOME/.config/nvim/init.vim" ]; then
    rm -f "$HOME/.config/nvim/init.vim.bak"
    [[ -f "$HOME/.config/nvim/init.vim" ]] && mv "$HOME/.config/nvim/init.vim" "$HOME/.config/nvim/init.vim.bak"
fi

curl -Lso "$HOME/.config/nvim/init.vim" https://kylegengler.com/devenv/config.vim

ln -s "$HOME/.config/nvim" "$HOME/.vim"
ln -s "$HOME/.config/nvim/init.vim" "$HOME/.vimrc"

# if we're on mac os source set up bash_profile to source bashrc
if [ "$IS_MACOS" == "Yes" ]; then
    rm -rf "$HOME/.bash_profile" && \
    echo '[[ -f "$HOME/.bashrc ]] && source "$HOME/.bashrc"' > "$HOME/.bash_profile"
fi

source "$HOME/.bashrc"

