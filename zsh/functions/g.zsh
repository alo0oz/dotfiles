# https://github.com/pengwynn/dotfiles/blob/master/git/git.zsh
# Wrap git with hub
if [[ -f `command -v hub` ]] ; then
    alias git=hub
    compdef g=hub
  else
    compdef g=git
fi

function g {
  if [[ $# > 0 ]]; then
    git "$@"
  else
    echo "Last commit: $(time_since_last_commit) ago"
    git status --short --branch
  fi
}

function time_since_last_commit() {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  git log -1 --pretty=format:"%ar" | sed 's/\([0-9]*\) \(.\).*/\1\2/'
}


