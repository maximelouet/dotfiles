# Saumon dotfiles

My main personal configuration files along with some custom scripts.

i3blocks scripts have been moved to another repository: [i3blocks-scripts](https://github.com/maximelouet/i3blocks-scripts).

This repo currently contains configuration files for:

* **[i3](https://i3wm.org/)** (`i3/config`) with **[i3blocks](https://github.com/vivien/i3blocks)** (`i3/blocks`)
* **[zsh](https://www.zsh.org/)** (`zshrc`) and many aliases (`zsh_aliases`), with **[prezto](https://github.com/sorin-ionescu/prezto/)** (`zpreztorc`) and a customized agnoster theme
* **[vim](http://www.vim.org/)** (`vimrc`, `vim/`) with **[vim-airline](https://github.com/vim-airline/vim-airline)** and a big mess
* **[git](https://git-scm.com/)** (`gitconfig`)
* **[screen](https://www.gnu.org/software/screen/)** (`screenrc`)
* **[tmux](https://tmux.github.io/)** (`tmux.conf`)
* **[termite](https://github.com/thestinger/termite)** (`config/termite/config`)

... and other programs that I may or may not use. I also included some files from /etc, located in the `etc/` directory.

I created a `deploy.sh` script that automatically links all the dotfiles to a specified directory (usually $HOME). **This script is a work in progress, use at your own risk!**
