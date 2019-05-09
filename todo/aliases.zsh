alias today=$DOTFILES/todo/today.zsh
alias now="today `date +%H:%M`:"
alias todo='today [ ] '
alias todo-list="ag --nobreak --nocolor --nonumbers '\- \[ \]' ~/notes/*"

