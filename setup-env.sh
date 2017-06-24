#!/bin/bash

repo_base_url='https://raw.githubusercontent.com/kgengler/setup-mac-environment/master'

[[ -z "$(which brew)" ]] && /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# install homebrew packages
brew update && \
brew install $(curl -Ls $repo_base_url/homebrew-packages.txt)

# use current directory if $HOME isn't set
if [ -z "$HOME" ]; then
    $HOME=$(pwd)
fi

# Set up neovim
if [ -d "$HOME/.vim" ]; then
    mv "$HOME/.vim" "$HOME/.vim.bak"
fi

if [ -f "$HOME/.vimrc" ]; then
    mv "$HOME/.vimrc" "$HOME/.vimrc.bak"
fi

if [ -d "$HOME/.config" ]; then
    if [ -d "$HOME/.config/nvim" ]; then
        mv "$HOME/.config/nvim" "$HOME/.config/nvim.bak"
    fi
fi

mkdir -p "$HOME/.config/nvim"
curl -Lso "$HOME/.config/nvim/init.vim" "$repo_base_url/config.vim"

ln -s "$HOME/.config/nvim" "$HOME/.vim"
ln -s "$HOME/.config/nvim/init.vim" "$HOME/.vimrc"

git clone https://github.com/VundleVim/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim

 vim -c PluginInstall -c quitall
 vim -c PluginClean -c quitall

# Get .bash_profile
if [ -f "$HOME/.bash_profile" ]; then
    mv "$HOME/.bash_profile" "$HOME/.bash_profile.bak"
fi

# TODO:
# - gpg configuration
# - ssh configuration

curl -Lso "$HOME/.bash_profile" "$repo_base_url/.bash_profile"
source "$HOME/.bash_profile"

