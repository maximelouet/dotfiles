# Saumon dotfiles

My main personal configuration files.

This repo currently contains configuration files for:

* **[i3](https://i3wm.org/)** (`config/i3/config`) with **[i3blocks](https://github.com/vivien/i3blocks)** (`config/i3/blocks`). The corresponding scripts are located in my [i3blocks-scripts](https://github.com/maximelouet/i3blocks-scripts) repository which is cloned as a submodule in `config/i3/scripts`.
* **[zsh](https://www.zsh.org/)** (`zshenv`, `zsh/`), with **[prezto](https://github.com/sorin-ionescu/prezto/)** (`zsh/zpreztorc`)
* **[vim](https://www.vim.org/)** (`config/vim/`)
* **[git](https://git-scm.com/)** (`config/git/config`)
* **[kitty](https://sw.kovidgoyal.net/kitty/)** (`config/kitty/`)
* **[picom](https://github.com/yshui/picom)** (`config/picom.conf`)

... and other programs that I may or may not use.

**[Dotbot](https://git.io/dotbot)** is included and can be used to install the dotfiles.
To symlink all the dotfiles to the correct locations in your home directory, run:

```bash
./install
```

Running Dotbot will NOT delete existing files/directories in your home directory, excepted:
* `.gtkrc-2.0`
* `.icons/default/index.theme`
