function sess {
    local SESS=${1:-"main"}
    tmux attach -t $SESS || tmux new-session -s $SESS
}
alias lss="tmux ls"

# https://github.com/szymonkaliski/dotfiles/blob/ad449834cedf28d026bbab0c57413d049c7dc45d/Dotfiles/zshrc#L605-L621
# but changed to work with windows instead of panes
function twin() {
  local sessions target

  sessions=$(tmux list-sessions -F '#S;#W;#{window_panes};#{pane_current_path}')
  target=$(echo "$sessions" | column -t -s ";" | fzf --select-1 --exit-0 --query="$1" --prompt="tmux > ") || return

  local target_session=$(echo $target | cut -d " " -f1)

  if [ -z "$TMUX" ]; then
    tmux attach-session -t "$target_session"
  else
    tmux switch-client -t "$target_session"
  fi
}

# Project Switcher, based on the above, but looking at folders
function tpro() {
  local projects session session_name session_folder

  projects=$(
    ls -l ~/code/ | awk '$1 ~ /^d/ {print $9}' |
    while read project; do
      if [[ -f "$HOME/code/$project/.tmux-session-name" ]]; then
        echo "$(cat $HOME/code/$project/.tmux-session-name),$project"
      else
        echo "$project,$project"
      fi
    done; echo "dotfiles,../dotfiles"
  )

  session=$(echo "$projects" | xsv table | fzf --select-1 --exit-0 --prompt="tmux > ")
  session_name=$(echo $session | awk '{ print $1 }')
  session_folder=$(echo $session | awk "{ print \"$HOME/code/\" \$2 }")

  tmux has-session -t $session_name 2>/dev/null

  if [ $? != 0 ]; then
    tmux new-session -d -s $session_name -c "$session_folder"
  fi

  # Attach to created session
  if [ -z "$TMUX" ]; then
    tmux attach-session -t "$session_name"
  else
    tmux switch-client -t "$session_name"
  fi
}
