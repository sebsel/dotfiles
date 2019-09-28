function sess {
    local SESS=${1:-"main"}
    tmux attach -t $SESS || tmux new-session -s $SESS
}
alias lss="tmux ls"

# https://github.com/szymonkaliski/dotfiles/blob/ad449834cedf28d026bbab0c57413d049c7dc45d/Dotfiles/zshrc#L605-L621
# but changed to work with windows instead of panes
function ftwindow() {
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
