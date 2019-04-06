#!/bin/bash

# This file serves as documentation. I haven't actually run it.

#==> Set up vim-plug 
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

#==> To install all the brew stuff
brew bundle --file=~/dotfiles/Brewfile
