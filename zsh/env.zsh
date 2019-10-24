#
# Saumon ZSH dotfiles
# env
#

export LANG='en_US.UTF-8'
export LC_ALL='en_US.UTF-8'

export EDITOR='vim'
export VISUAL='vim'
export PAGER='less -X'
export MANPAGER="$PAGER"
export TERM=xterm-256color

export USER='saumon'
export TEKLOGIN='maxime.louet@epitech.eu'
export FULLNAME='Maxime Louet'

export CASE_SENSITIVE='true'
export CLICOLOR=1

export HISTFILE="$HOME/.zsh/history"
export HISTSIZE=50000
export SAVEHIST=99999

export QT_AUTO_SCREEN_SCALE_FACTOR=0
export QT_QPA_PLATFORMTHEME=gtk2

export TZ='Europe/London'

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"

export WATCH='all'

export ANDROID_HOME=$HOME/software/Android
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools

export ANSIBLE_COW_SELECTION=random
