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
