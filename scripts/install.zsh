#!/bin/bash

# Remove last login from terminal
touch ~/.hushlogin

# === Git ===
git config --global core.excludesfile ~/.gitignore_global
ln -sf ~/dotfiles/git/gitignore_global ~/.gitignore_global

#-> https://tbaggery.com/2011/08/08/effortless-ctags-with-git.html
git config --global init.templatedir '~/dotfiles/git/templates'
git config --global alias.ctags '!.git/hooks/ctags'


# === VIM ===

# Set up Symlinks
ln -sf ~/dotfiles/vim/vimrc ~/.vimrc
rm ~/.vim
ln -sf ~/dotfiles/vim/ ~/.vim

echo "Downloading vim-plug"
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim \
    && echo "Success!"
vim +PlugInstall +qall
echo ""


# === TMUX ===

ln -sf ~/dotfiles/tmux/tmux.conf ~/.tmux.conf


# === ZSH ===

ln -sf ~/dotfiles/zsh/zshrc ~/.zshrc


# === FZF ===

ln -sf ~/dotfiles/fzf/fzf.zsh ~/.fzf.zsh


# === iTerm ===
ln -sf ~/dotfiles/iterm/tmux-profile.json \
    ~/Library/Application\ Support/iTerm2/DynamicProfiles/tmux-profile.json


# === Brew ===

echo "Don't forget to run Brew!"
echo ""
echo "  $ brew bundle"
echo ""
