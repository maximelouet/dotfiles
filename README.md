# Saumon dotfiles

My main personal configuration files.

This repo currently contains configuration files for:

* **[i3](https://i3wm.org/)** (`config/i3/config`) with **[i3blocks](https://github.com/vivien/i3blocks)** (`config/i3/blocks`) and shell scripts for it (`config/i3/scripts`)
* **[zsh](https://www.zsh.org/)** (`zshrc`) and many aliases (`zsh_aliases`), with **[prezto](https://github.com/sorin-ionescu/prezto/)** (`zpreztorc`) and a customized agnoster theme (`saumon.zsh-theme`)
* **[neovim](https://neovim.io/)** (`config/nvim/`) with **[vim-airline](https://github.com/vim-airline/vim-airline)** and some other plugins
* **[git](https://git-scm.com/)** (`gitconfig`)
* **[termite](https://github.com/thestinger/termite)** (`config/termite/config`)
* **[compton](https://github.com/chjj/compton)** (`config/compton.conf`)

... and other programs that I may or may not use. I also included some files from /etc, located in the `etc/` directory.

I created a `deploy.sh` script that automatically links all the dotfiles to a specified directory (by default $HOME) and takes care of creating/cloning some needed dependencies.
