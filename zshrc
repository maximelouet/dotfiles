# Saumon

source "/data/.zprezto/init.zsh" # prezto

function has_command()
{
  command -v $1 > /dev/null 2>&1;
}

export TERM="xterm-256color"
export DEFAULT_USER=saumon
export PAGER='less -X'
export MANPAGER='less -X'
export TERMINAL="termite"
export BROWSER='chromium'
if has_command nvim; then
  export EDITOR='nvim'
  export VISUAL='nvim'
else
  export EDITOR='vim'
  export VISUAL='vim'
fi
export LANG='en_US.UTF-8';
export LC_ALL='en_US.UTF-8';
export CASE_SENSITIVE="true" # case-sensitive completion
export CLICOLOR=1
export DISPLAY="${DISPLAY:-:0}"
export TZ='Europe/Paris'

export HISTFILE=/data/.zsh_history
export HISTSIZE=10000
export SAVEHIST=50000


ulimit -c 0
export PATH="/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/data/.local/bin"
export WATCH='all'

export TEKUSER="maxime.louet@epitech.eu"
export USER_NICKNAME="Maxime Louet"

[[ -e /usr/share/fzf/key-bindings.zsh ]] && source /usr/share/fzf/key-bindings.zsh
[[ -e /usr/share/fzf/completion.zsh ]] && source /usr/share/fzf/completion.zsh

export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'

# Ignore .o when opening files with vim
zstyle ':completion:*:*:vim:*:*files' ignored-patterns '*.o'


source /data/.zsh_aliases
[[ -e /data/.zsh_private ]] && source /data/.zsh_private
