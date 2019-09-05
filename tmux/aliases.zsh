function sess {
    local SESS=${1:-"main"}
    tmux attach -t $SESS || tmux new-session -s $SESS
}
alias lss="tmux ls"

# https://github.com/szymonkaliski/dotfiles/blob/ad449834cedf28d026bbab0c57413d049c7dc45d/Dotfiles/zshrc#L605-L621
# but changed to work with windows instead of panes
function ftwindow() {
  local windows target

  windows=$(tmux list-windows -a -F '#S;###I;#{window_name};#{pane_current_path}')
  target=$(echo "$windows" | column -t -s ";" | fzf --select-1 --exit-0 --query="$1" --prompt="tmux > ") || return

  local target_session=$(echo $target | cut -d " " -f1)
  local target_window=$(echo $target | cut -d "#" -f2 | cut -d " " -f1)

  if [ -z "$TMUX" ]; then
    tmux attach-session -t "$target_session" \; select-pane -t "$target_window"
  else
    tmux switch-client -t "$target_session:$target_window"
  fi
}
