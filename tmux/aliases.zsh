function sess {
    local SESS=${1:-"main"}
    tmux attach -t $SESS || tmux new-session -s $SESS
}
alias lss="tmux ls"
