#!/bin/bash

# Remove last login from terminal
touch ~/.hushlogin

# === Git ===
git config --global core.excludesfile ~/.gitignore_global
ln -sf ~/dotfiles/git/gitignore_global ~/.gitignore_global


# === Sublime ===

ln -sf ~/dotfiles/sublime/preferences.json \
  ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/Preferences.sublime-settings
ln -sf ~/dotfiles/sublime/keymap.json \
  ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/Default\ \(OSX\).sublime-keymap
ln -sf ~/dotfiles/sublime/packages.json \
  ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/Package\ Control.sublime-settings


# === VIM ===

# Set up Symlinks
ln -sf ~/dotfiles/vim ~/.vim
ln -sf ~/dotfiles/vim/vimrc ~/.vimrc

# Set up Vim plugins
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall


# === TMUX ===

ln -sf ~/dotfiles/tmux/tmux.conf ~/.tmux.conf


# === ZSH ===

ln -sf ~/dotfiles/zsh/zshrc ~/.zshrc

