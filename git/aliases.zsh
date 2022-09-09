# === Git ===

function g {
  # With arguments: acts like `git`
  if [[ $# > 0 ]]; then
    git $@
  else
    git status
  fi
}

# Complete g like git
compdef g=git

alias gs="git status -bs"
alias gc="git commit -v"
alias gp="git push"
alias gpl="git pull"
alias nah="git reset --hard && git clean -df"
alias wip="git add . && git commit -m \"wip\""
