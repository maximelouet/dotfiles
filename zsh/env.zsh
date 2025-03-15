#
# Saumon ZSH dotfiles
# env: export common global environment variables
#

export LANG='en_US.UTF-8'
export LC_ALL='en_US.UTF-8'
# Currency in Euros
export LC_MONETARY="fr_FR.UTF-8"

export EDITOR='vim'
export VISUAL='vim'
# bat highlights some languages. -p (plain) skips borders and line numbers.
export PAGER="bat -p"
export MANPAGER="$PAGER"
export TERM=xterm-256color

export USER='saumon'

export CASE_SENSITIVE='true'
export CLICOLOR=1

export QT_AUTO_SCREEN_SCALE_FACTOR=0
export QT_QPA_PLATFORMTHEME=gtk2

export TZ='Europe/Paris'

# Default XDG values
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

# Sensible storage locations
export PSQL_HISTORY=$XDG_DATA_HOME/psql_history
export LESSHISTFILE=$XDG_DATA_HOME/less_history
export IPYTHONDIR=$XDG_DATA_HOME/ipython
export GNUPGHOME=$XDG_DATA_HOME/gnupg

export WATCH='all'

export NVM_DIR=$HOME/.config/nvm

export ANSIBLE_NOCOWS=1
export ANSIBLE_STDOUT_CALLBACK=yaml  # https://twitter.com/svg/status/1370099072959455238

# Use gnome-keyring-daemon as ssh agent (needs gcr-4 package)
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/gcr/ssh"

# https://github.com/nvbn/thefuck/issues/1207#issuecomment-864671223
export THEFUCK_PRIORITY="git_hook_bypass=1100"

if [[ $XDG_SESSION_TYPE == "wayland" ]]; then
  export MOZ_ENABLE_WAYLAND=1
  export QT_QPA_PLATFORM=wayland
  export QT_WAYLAND_DISABLE_WINDOWDECORATION=1
  export CLUTTER_BACKEND=wayland
  export ELECTRON_OZONE_PLATFORM_HINT=wayland
  # Setting this globally breaks apps
  #export GDK_BACKEND=wayland
fi

export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'

export RIPGREP_CONFIG_PATH="$XDG_CONFIG_HOME/ripgrep/ripgreprc"

# Used by i3-sensible-terminal
export TERMINAL="kitty"


# Path additions

addtopath() {
  if [ -d "$1" ] && [[ ":$PATH:" != *":$1:"* ]]; then
    PATH="${PATH:+"$PATH:"}$1"
  fi
}

addtopath "$HOME/go/bin"
addtopath "$HOME/.local/bin"
addtopath "$HOME/.poetry/bin"
addtopath "$HOME/.yarn/bin"
addtopath "$HOME/.cargo/bin"
addtopath "$HOME/.local/share/JetBrains/Toolbox/scripts"

source "$HOME/.cargo/env"
