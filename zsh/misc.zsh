#
# Saumon ZSH dotfiles
# misc
#

ulimit -c 0

# fg when pressing Ctrl+Z
function fancy-ctrl-z () {
  if [[ $#BUFFER -eq 0 ]]; then
    if [[ $(jobs | wc -l) -gt 0 ]]; then
      BUFFER='fg'
      zle accept-line
    fi
  else
    zle push-input
    zle clear-screen
  fi
}
zle -N fancy-ctrl-z
bindkey '^Z' fancy-ctrl-z

if (( $+commands[thefuck] )); then
  eval $(thefuck --alias)
fi

if (( $+commands[kubectl] )); then
  source <(kubectl completion zsh)
fi

export NVM_DIR="$HOME/.config"
[ -s "$NVM_DIR/nvm.sh" ] && source "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && source "$NVM_DIR/bash_completion"
