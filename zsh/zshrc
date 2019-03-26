#
# Saumon ZSH dotfiles
# zshrc
#

# prezto, a configuration framework for Zsh
source "$HOME/.zsh/prezto/init.zsh"

# load custom dotfiles
for file in "$HOME/.zsh/"*.zsh; do
  source "${file}"
done

# fzf, command-line fuzzy finder
if [[ -f "/usr/share/fzf/key-bindings.zsh" ]]; then
  source "/usr/share/fzf/key-bindings.zsh"
fi
