#
# Saumon ZSH dotfiles
# aliases
#

for file in "$HOME"/.zsh/aliases/*.zsh; do
  source "${file}"
done
