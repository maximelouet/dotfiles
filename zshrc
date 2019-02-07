# Saumon

# BEGIN user settings
export USER='saumon'
export TEKLOGIN='maxime.louet@epitech.eu'
export FULLNAME='Maxime Louet'
# END user settings

source "$HOME/.zprezto/init.zsh" # prezto

export TERM='xterm-256color'
export PAGER='less -X'
export MANPAGER="$PAGER"
export TERMINAL='alacritty'
export BROWSER='chromium'
if command -v nvim > /dev/null 2>&1; then
  export EDITOR='nvim'
  export VISUAL='nvim'
else
  export EDITOR='vim'
  export VISUAL='vim'
fi
export LANG='en_GB.UTF-8'
export LC_ALL='en_GB.UTF-8'
export QT_AUTO_SCREEN_SCALE_FACTOR=0
export CASE_SENSITIVE='true'
export CLICOLOR=1
#export DISPLAY="${DISPLAY:-:0}"
export TZ='Europe/Paris'

export HISTFILE="$HOME/.zsh_history"
export HISTSIZE=10000
export SAVEHIST=50000

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
