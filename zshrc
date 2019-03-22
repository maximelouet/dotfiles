# Saumon

# BEGIN user settings
export USER='saumon'
export TEKLOGIN='maxime.louet@epitech.eu'
export FULLNAME='Maxime Louet'
# END user settings

source "$HOME/.zprezto/init.zsh" # prezto

export PAGER='less -X'
export MANPAGER="$PAGER"
export BROWSER='chromium'
export EDITOR='vim'
export VISUAL='vim'
export LANG='en_GB.UTF-8'
export LC_ALL='en_GB.UTF-8'
export QT_AUTO_SCREEN_SCALE_FACTOR=0
export CASE_SENSITIVE='true'
export CLICOLOR=1
export TZ='Europe/Paris'

export HISTFILE="$HOME/.zsh_history"
export HISTSIZE=50000
export SAVEHIST=99999

ulimit -c 0
export PATH="$HOME/.local/bin:/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:$HOME/.npm-global/bin:$HOME/.config/composer/vendor/bin"
export WATCH='all'

# Ignore .o when opening files with vim
zstyle ':completion:*:*:vim:*:*files' ignored-patterns '*.o'

# fg when pressing Ctrl+Z
function fancy-ctrl-z () {
  if [[ $#BUFFER -eq 0 ]]; then
    if [[ $(jobs | wc -l) -gt 0 ]]; then
      BUFFER='fg'
      zle accept-line
    fi
  else
    zle push-input
    zle clear-screen
  fi
}
zle -N fancy-ctrl-z
bindkey '^Z' fancy-ctrl-z

source "$HOME/.zsh_aliases"

if [ -f "$HOME/.zsh_private" ]; then
  source "$HOME/.zsh_private"
fi

[ -f "/usr/share/fzf/key-bindings.zsh" ] && source "/usr/share/fzf/key-bindings.zsh"

eval $(thefuck --alias)

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
