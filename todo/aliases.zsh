alias today=$DOTFILES/todo/today.zsh
alias now="today \`date +%H:%M\`:"
alias todo-list="ag --nobreak --nocolor --nonumbers '^\s*\- \[ \]' ~/notes/*"
alias todo-vlist="vim \`todo-list -l\`"
function todo { if [ -n "$*" ]; then; today "[ ] $*"; else; todo-list; fi }

