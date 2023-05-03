#
# Saumon ZSH dotfiles
# env: export common global environment variables
#

export LANG='en_US.UTF-8'
export LC_ALL='en_US.UTF-8'

export EDITOR='vim'
export VISUAL='vim'
export PAGER='less -X'
export MANPAGER="$PAGER"
export TERM=xterm-256color

export USER='saumon'

export CASE_SENSITIVE='true'
export CLICOLOR=1

export HISTFILE="$HOME/.zsh/history"
export HISTSIZE=500000
export SAVEHIST=$HISTSIZE

export QT_AUTO_SCREEN_SCALE_FACTOR=0
export QT_QPA_PLATFORMTHEME=gtk2

export TZ='Europe/Paris'

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"

export WATCH='all'

export NVM_DIR=$HOME/.config/nvm

export ANSIBLE_NOCOWS=1
export ANSIBLE_STDOUT_CALLBACK=yaml  # https://twitter.com/svg/status/1370099072959455238

# https://github.com/nvbn/thefuck/issues/1207#issuecomment-864671223
export THEFUCK_PRIORITY="git_hook_bypass=1100"

if [[ $XDG_SESSION_TYPE == "wayland" ]]; then
  export MOZ_ENABLE_WAYLAND=1
  export QT_QPA_PLATFORM=wayland
  export CLUTTER_BACKEND=wayland
  # Setting this globally breaks apps
  #export GDK_BACKEND=wayland
fi

export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'

export RIPGREP_CONFIG_PATH="$XDG_CONFIG_HOME/ripgrep/ripgreprc"
