#
# Saumon ZSH dotfiles
# aliases: source all alias files
#

for file in "$HOME"/.zsh/aliases/*.zsh; do
  source "${file}"
done
