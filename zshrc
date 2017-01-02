# Saumon

source "/data/.zprezto/init.zsh" # prezto

export TERM="xterm-256color"
export DEFAULT_USER=saumon
export PAGER='less -X'
export MANPAGER='less -X'
export BROWSER='firefox'
export EDITOR='vim'
export VISUAL='vim'
export LANG='en_US.UTF-8';
export LC_ALL='en_US.UTF-8';
export CASE_SENSITIVE="true" # case-sensitive completion
export CLICOLOR=1
export DISPLAY="${DISPLAY:-:0}"

export HISTFILE=/data/.zsh_history
export HISTSIZE=10000
export SAVEHIST=50000


# EPITECH
ulimit -c 0
export PATH="/bin:/sbin:/usr/bin:/usr/sbin:/data/.gem/ruby/2.3.0/bin"
export MAIL="/u/all/${USER}/mail/${USER}"
export WATCH='all'

export TEKUSER="maxime.louet@epitech.eu"
export USER_NICKNAME="Maxime Louet"

### C Graphical Programming
export LIBRARY_PATH=$LIBRARY_PATH:/data/.graph_programming/lib
export LD_LIBRARY_PATH=$LIBRARY_PATH:/data/.graph_programming/lib
export CPATH=$CPATH:/data/.graph_programming/include


source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh

export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'

# Ignore .o when opening files with vim
zstyle ':completion:*:*:vim:*:*files' ignored-patterns '*.o'


source /data/.zsh_aliases

source /data/.zsh_private
