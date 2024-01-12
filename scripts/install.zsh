#!/bin/bash

# Remove last login from terminal
touch ~/.hushlogin

# === Git ===
ln -sfh ~/dotfiles/git/gitconfig ~/.gitconfig
#-> https://tbaggery.com/2011/08/08/effortless-ctags-with-git.html
# git config --global init.templatedir '~/dotfiles/git/templates'
# git config --global alias.ctags '!.git/hooks/ctags'


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

mkdir -p ~/.config
ln -sfh ~/dotfiles/alacritty/ ~/.config/alacritty
ln -sfh ~/dotfiles/nitrogen/ ~/.config/nitrogen
ln -sfh ~/dotfiles/awesome/ ~/.config/awesome
# ln -sfh ~/dotfiles/yabai/ ~/.config/yabai

# === homescaping ===

mkdir -p ~/code

# === Brew ===

echo "Don't forget to run Brew!"
echo ""
echo "  $ brew bundle"
echo ""
