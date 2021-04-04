#!/bin/bash

# Remove last login from terminal
touch ~/.hushlogin

# === Git ===
git config --global core.excludesfile ~/.gitignore_global
ln -sfh ~/dotfiles/git/gitignore_global ~/.gitignore_global

#-> https://tbaggery.com/2011/08/08/effortless-ctags-with-git.html
git config --global init.templatedir '~/dotfiles/git/templates'
git config --global alias.ctags '!.git/hooks/ctags'


# === VIM ===

# Set up Symlinks
ln -sfh ~/dotfiles/vim/vimrc ~/.vimrc
ln -sfh ~/dotfiles/vim/ ~/.vim

if [ ! -f ~/.vim/autoload/plug.vim ]; then
  echo "Downloading vim-plug"
  curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim \
      && echo "Success!"
fi
vim +PlugInstall +qall


# === ~/.foo ===

ln -sfh ~/dotfiles/tmux/tmux.conf ~/.tmux.conf
ln -sfh ~/dotfiles/zsh/zshrc ~/.zshrc
ln -sfh ~/dotfiles/fzf/fzf.zsh ~/.fzf.zsh
ln -sfh ~/dotfiles/hammerspoon/ ~/.hammerspoon

# === ~/.config/foo  ===

ln -sfh ~/dotfiles/alacritty/ ~/.config/alacritty
ln -sfh ~/dotfiles/karabiner/ ~/.config/karabiner
ln -sfh ~/dotfiles/yabai/ ~/.config/yabai

# === iTerm ===
ln -sfh ~/dotfiles/iterm/tmux-profile.json \
    ~/Library/Application\ Support/iTerm2/DynamicProfiles/tmux-profile.json


# === Brew ===

echo "Don't forget to run Brew!"
echo ""
echo "  $ brew bundle"
echo ""
