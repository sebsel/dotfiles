# === Git ===

# note to self: there are also aliases from the oh-my-zsh plugin
# github.com/robbyrussell/oh-my-zsh/blob/master/plugins/git/git.plugin.zsh

alias gs="git status -bs"
alias gl="git log"
alias gcom="git checkout main"
alias gcod="git checkout develop"
alias gcor="git checkout release"
alias gcof="git checkout \$(git branch --format \"%(refname:short)\" | fzf)"
alias gaa="git add ."
alias gc="EDITOR=vim git commit -v"
alias gp="git push"
alias gpl="git pull"
alias gd="git diff"
alias gdc="git diff --cached"
alias nah="git reset --hard && git clean -df"
alias wip="git add . && git commit -m \"wip\""
alias git-hash="git rev-parse --short HEAD"
alias git-init="git init -b main && gaa && git commit -q"

#=== Git Tower ===
alias tower="gittower"

