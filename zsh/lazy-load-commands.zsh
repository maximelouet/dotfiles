#
# Saumon ZSH dotfiles
# lazy-load-commands
#

# fuck: 150ms
if [ $commands[thefuck] ]; then
  fuck() {
    eval $(thefuck --alias)
    fuck $@
  }
fi

# kubectl: 280ms
if [ $commands[kubectl] ]; then
  k() {
    source <(kubectl completion zsh)
    alias k=kubectl
    kubectl $@
  }
fi

# nvm: 500 FUCKING MILLISECONDS
if [ -n "$NVM_DIR" ] && [ -f "$NVM_DIR/nvm.sh" ]; then
  nvm() {
    unset -f nvm
    source "$NVM_DIR/nvm.sh"
    source "$NVM_DIR/bash_completion"
    nvm $@
  }
fi
