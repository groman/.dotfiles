#!/bin/bash

# get directory this script is in
dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# link up git dotfiles to home dotfiles
ln -s $dir/.bash_profile ~/.bash_profile
ln -s $dir/.gitconfig ~/.gitconfig

# install brew
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# install nvim
brew install neovim/neovim/neovim

ln -s $dir/vim ~/.config/nvim
ln -s $dir/vimrc ~/.config/nvim/init.vim

# install vim plug
mkdir -p $dir/vim/autoload/
curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim


# command line utilities
brew install git
brew install fasd
brew install ag
brew install jq
brew install aria2
brew install bash-git-prompt
brew install universal-ctags --HEAD
