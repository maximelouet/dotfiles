# Saumon dotfiles

My main personal configuration files.

This repo currently contains configuration files for:

* **[sway](https://swaywm.org/)** (`config/sway/config`) with **[waybar](https://github.com/Alexays/Waybar)** (`config/waybar/`). Some custom waybar modules are located in my [waybar-scripts](https://github.com/maximelouet/waybar-scripts) repository which is cloned as a submodule.
* **[zsh](https://www.zsh.org/)** (`zshenv`, `zsh/`), with **[prezto](https://github.com/sorin-ionescu/prezto/)** (`zsh/zpreztorc`)
* **[vim](https://www.vim.org/)** (`config/vim/`)
* **[git](https://git-scm.com/)** (`config/git/config`)
* **[kitty](https://sw.kovidgoyal.net/kitty/)** (`config/kitty/`)
* **[dunst](https://dunst-project.org/)** (`config/dunst/`)
* **[rofi](https://davatorium.github.io/rofi/)** (`config/rofi/`)

... and other programs that I may or may not use.

**[Dotbot](https://git.io/dotbot)** is included and can be used to install the dotfiles.
To symlink all the dotfiles to the correct locations in your home directory, run:

```bash
./install
```

Running Dotbot will NOT delete existing files/directories in your home directory, except:
* `.gtkrc-2.0`
* `.icons/default/index.theme`
