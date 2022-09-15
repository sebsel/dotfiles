# === Git ===

function g {
  # With arguments: acts like `git`
  if [[ $# > 0 ]]; then
    git $@
  else
    git status -bs
  fi
}

# Complete g like git
compdef g=git
