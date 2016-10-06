#!/bin/bash

set -x -e

# get directory this script is in
dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# link up git dotfiles to home dotfiles
ln -sf $dir/gitconfig ~/.gitconfig
ln -vsf $dir/profile ~/.profile
ln -vsf $dir/inputrc ~/.inputrc
ln -vsf $dir/bashrc ~/.bashrc
ln -vsf $dir/gitignore ~/.config/git/ignore
ln -vsf $dir/pythonrc ~/.pythonrc
for x in $dir/bashrc.*; do
    ln -vsf $x ~/.$(basename $x)
done


# install brew of some kind
# OSX: ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
# linux:
#ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install)"
PATH="$HOME/.linuxbrew/bin:$PATH"

# install nvim
brew install neovim/neovim/neovim

# verify this works when there's already shit here...
if [ -d ~/.config/nvim ]; then
    mv ~/.config/nvim ~/.config/nvim.$(date +%s)
fi
mkdir -p ~/.config/

ln -s $dir/vim ~/.config/nvim

# command line utilities
brew install python
brew install git
brew install fasd
brew install ag
brew install jq
brew install aria2
brew install bash-git-prompt

#brew tap universal-ctags/universal-ctags
#brew install universal-ctags/universal-ctags/universal-ctags

#brew install homebrew/dupes/openssh
