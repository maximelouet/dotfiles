#
# Saumon ZSH dotfiles
# zshenv: set basic env variables and source main env file
#

function appendpath () {
  case ":$PATH:" in
    *:"$1":*)
      ;;
    *)
      PATH="${PATH:+$PATH:}$1"
  esac
}

appendpath "$HOME/.local/bin"
appendpath "$HOME/.yarn/bin"
appendpath "$HOME/.poetry/bin"

unset appendpath
export PATH

export ZDOTDIR="$HOME/.zsh"

source "$ZDOTDIR/env.zsh"
