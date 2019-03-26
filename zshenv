#
# Saumon ZSH dotfiles
# zshenv
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
appendpath "$HOME/.npm-global/bin"
appendpath "$HOME/.yarn/bin"
appendpath "$HOME/.config/yarn/global/node_modules/.bin"

unset appendpath
export PATH

source "$HOME/.zsh/env.zsh"
