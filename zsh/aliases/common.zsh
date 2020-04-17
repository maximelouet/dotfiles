#
# Saumon ZSH aliases
# common
#

# go up in directory tree
up() {
  local d=""
  limit=$1
  for ((i=1 ; i <= limit ; i++))
  do
    d=$d/..
  done
  d=$(echo $d | sed -e 's/^\///')
  if [ -z "$d" ]; then
    d=..
  fi
  cd $d
}
# go up in directory tree and list its content
u() {
  local d=""
  limit=$1
  for ((i=1 ; i <= limit ; i++))
  do
    d=$d/..
  done
  d=$(echo $d | sed -e 's/^\///')
  if [ -z "$d" ]; then
    d=..
  fi
  cd $d || return
  ls
}

# cd and ls
c() {
  cd "$@" && ls
}

# give execute rights to files
cx() {
  chmod +x "$@"
}

# delete temporary files
mr_clean() {
  find -name "*~" -delete -o -name "#*#" -delete -o -name "a.out" -delete -o -name ".#*" -delete
}

diff () {
  if (( $+commands[git] )); then
    git --no-pager diff --color=auto --no-ext-diff --no-index "$@"
  else
    command diff --unified "$@"
  fi
}

# open file in vim with Goyo
vg () {
  vim "$@" +Goyo
}

# decode base64 shortcut
bd() {
  echo -n "$1" | base64 -d -w 0 && echo -n "$1" | base64 -d -w 0 | xclip -selection clipboard
}
# encode base64 shortcut
be() {
  echo -n "$1" | base64 -w 0 && echo -n "$1" | base64 -w 0 | xclip -selection clipboard
}

# open
alias v='vim'
alias vi='vim'
alias vim='vim'

# colors everywhere
alias dir='dir --color=auto'
alias vdir='vdir --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias ip='ip --color'

# colors FUCKING EVERYWHERE
if (( $+commands[colormake] )); then
  alias make='colormake'
fi
if (( $+commands[colour-valgrind] )); then
  alias valgrind='colour-valgrind'
fi

# directory listing
if (( $+commands[exa] )); then
  alias ls='exa --sort=Name --group-directories-first'
else
  alias ls='ls --color=always --group-directories-first -h'
fi
alias ll='ls -l'
alias l='ll'
if (( $+commands[exa] )); then
  alias lt='exa --sort=created -r --group-directories-first -l'
else
  alias lt='ll -t'
fi
alias lg='l -g'
alias la='ls -a'
alias lag='la -g'
alias llg='ll -g'
alias lla='l -a'
alias llag='lla -g'


# verbose operations
alias mv='mv -v'
alias rm='rm -I -v'
alias cp='cp -v'
alias ln='ln -v'

# edit shortcuts
alias ve="vim $HOME/.vim/vimrc"
alias ze="vim $HOME/.zsh/zshrc"
alias ie="vim $HOME/.config/i3/config"
alias ge="vim $HOME/.config/git/config"
alias pe='sudo vim /etc/pacman.conf'
alias ne='sudo vim /etc/nginx/nginx.conf'
alias me='sudo vim /etc/pacman.d/mirrorlist'
alias he='sudo vim /etc/hosts'

# corrections
alias gti='echo "pauvre merde";git'
alias mkae='echo "pauvre merde";make'
alias ma,='man'

# useful
alias sp='git add --all && git commit -m "Sync commit" && git push'

# shortcuts
alias j='jobs'
alias t='task'
alias ta='tree -a'
alias m='make -j'
alias e='unarchive'
alias d='docker'
#alias k='kubectl' # REPLACED by lazy-loading function in zshrc
alias copy='xclip -selection clipboard -i'
alias gitroot='cd `git-root`'

# misc
alias tree='tree -C'
alias calc='bc'
alias temp='cat /sys/class/thermal/thermal_zone0/temp'
alias week='date +%V'
alias myip='curl https://ip.saumon.io'
alias diskspace='df -P -kHl | grep -v tmpfs | grep -v "dev " | grep -v run'
alias riplaco='ping -i 1.5 8.8.8.8 | grep -E --only-match --color=never "[0-9\.]+ ms"'
alias path='echo $PATH | tr -s ":" "\n"'
alias pp="mpc toggle | tail -n2 | head -n1 | tr -d '[' | awk '{print \$1}' | tr -d ']' | tr '\n' ' ' | sed 's/playing//' | sed 's/paused//' && mpc status | head -n1 && pkill -RTMIN+13 i3blocks"
alias ccat='highlight -O ansi'
alias timestamp='date +%s'
alias beep_disable='xset b off'
alias beep_enable='xset b 100 600 50'
alias i3-info='i3-msg -t get_tree | jq'
alias :q='exit'
alias ipa='ip -brief a'

# some versions of watch support color
# but the program you're calling has to send it...
alias watch='watch --color -n1'
