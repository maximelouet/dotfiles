#
# Saumon ZSH dotfiles
# zshenv: set basic env variables and source main env file
#

addtopath() {
  if [ -d "$1" ] && [[ ":$PATH:" != *":$1:"* ]]; then
    PATH="${PATH:+"$PATH:"}$1"
  fi
}

addtopath "$HOME/go/bin"
addtopath "$HOME/.local/bin"
addtopath "$HOME/.poetry/bin"
addtopath "$HOME/.yarn/bin"

export ZDOTDIR="$HOME/.zsh"

source "$ZDOTDIR/env.zsh"
