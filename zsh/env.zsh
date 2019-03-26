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

export USER='saumon'
export TEKLOGIN='maxime.louet@epitech.eu'
export FULLNAME='Maxime Louet'

export CASE_SENSITIVE='true'
export CLICOLOR=1

export HISTFILE="$HOME/.zsh/history"
export HISTSIZE=50000
export SAVEHIST=99999

export QT_AUTO_SCREEN_SCALE_FACTOR=0
export TZ='Europe/Paris'

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"

export VIMINIT='let $MYVIMRC="$XDG_CONFIG_HOME/vim/vimrc" | source $MYVIMRC'
export ANDROID_HOME='/home/saumon/software/Android'

export WATCH='all'
