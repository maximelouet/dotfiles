#
# Saumon ZSH aliases
# common: main aliases and functions
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

diff() {
  if (( $+commands[git] )); then
    git --no-pager diff --color=auto --no-ext-diff --no-index "$@"
  else
    command diff --unified "$@"
  fi
}

# open file in vim with Goyo
vg() {
  vim "$@" +Goyo
}

# decode base64 shortcut
bd() {
  if [[ $XDG_SESSION_TYPE == "wayland" ]]; then
    echo -n "$1" | base64 -d -w 0 && echo -n "$1" | base64 -d -w 0 | wl-copy -n
  else
    echo -n "$1" | base64 -d -w 0 && echo -n "$1" | base64 -d -w 0 | xclip -selection clipboard -r
  fi
}
# encode base64 shortcut
be() {
  if [[ $XDG_SESSION_TYPE == "wayland" ]]; then
    echo -n "$1" | base64 -w 0 && echo -n "$1" | base64 -w 0 | wl-copy -n
  else
    echo -n "$1" | base64 -w 0 && echo -n "$1" | base64 -w 0 | xclip -selection clipboard -r
  fi
}

# close all SSH ControlMaster connections
ssh_close_all() {
  dir=$HOME/.ssh/sockets
  for i in $dir/*; do ssh -o ControlPath=$i -O exit squalala; done
}

# pull all direct subdirectories
fullpull() {
  RED='\033[0;31m'
  NC='\033[0m'
  dir="${1:-.}"

  for d in $dir/*/; do
    git -C "$d" pull > /dev/null
    branch=$(git -C "$d" branch --show-current)
    if [[ "$branch" != "master" ]] && [[ "$branch" != "main" ]]; then
      printf "${RED}Warning: ${d} is on branch ${branch}${NC}\n"
    fi
  done
}

# archlinux news
news() {
  echo -e "$(echo $(curl --silent https://www.archlinux.org/feeds/news/ | sed -e ':a;N;$!ba;s/\n/ /g') | \
    sed -e 's/&gt;/ç/g' |
  sed -e 's/&lt;\/aç/£/g' |
  sed -e 's/href\=\"/§/g' |
  sed -e 's/<title>/\\n\\n  :: \\e[01;31m/g' -e 's/<\/title>/\\e[00m ::\\n/g' |
  sed -e 's/<link>/ \>\\e[01;36m/g' -e 's/<\/link>/\\e[00m</g' |
  sed -e 's/<description>/\\n\\n\\e[00;37m/g' -e 's/<\/description>/\\e[00m\\n\\n/g' |
  sed -e 's/&lt;pç/\n/g' |
  sed -e 's/&lt;bç\|&lt;strongç/\\e[01;30m/g' -e 's/&lt;\/bç\|&lt;\/strongç/\\e[00;37m/g' |
  sed -e 's/&lt;a[^§]*§\([^\"]*\)\"[^ç]*ç\([^£]*\)[^£]*£/\\e[01;32m\2\\e[00;37m \\e[01;34m[ \\e[01;35m\1\\e[00;37m\\e[01;34m ]\\e[00;37m/g' |
  sed -e 's/&lt;liç/\n \\e[01;34m*\\e[00;37m /g' |
  sed -e 's/<[^>]*>/ /g' |
  sed -e 's/&lt;[^ç]*ç//g' |
  sed -e 's/[ç£§]//g')\n" | tail -n +5 | head -n 30
  echo -e "...\nhttps://www.archlinux.org/news/\n"
}

# command stats
zsh_stats() {
  fc -l 1 | awk '{CMD[$2]++;count++;}END { for (a in CMD)print CMD[a] " " CMD[a]/count*100 "% " a;}' | grep -v "./" | column -c3 -s " " -t | sort -nr | nl | head -n20
}

alias istheinternetonfire='dig +short txt istheinternetonfire.com'

# forecast
alias weather='curl -s wttr.in | head -n -2'
alias moon='curl -s wttr.in/Moon | head -n -2'

# prevent screen from locking or going off, and disable redshift
cinema() {
  killall redshift
  killall xautolock
  xset -dpms
  xset s noblank
  xset s off
}

certificate() {
  if [ -z "$1" ]; then
    >&2 echo "Error: please provide a domain name or URL as argument."
    return 1
  fi
  address=$(echo "$1" | sed -e 's|^[^/]*//||' -e 's|/.*$||')
  openssl s_client -showcerts -connect $address:443 < /dev/null 2>/dev/null | openssl x509 -dates -text -noout
}

certificate_info() {
  if [ -z "$1" ]; then
    >&2 echo "Error: please provide a domain name or URL as argument."
    return 1
  fi
  address=$(echo "$1" | sed -e 's|^[^/]*//||' -e 's|/.*$||')
  openssl s_client -connect $address:443 < /dev/null
}

certificate_validity() {
  if [ -z "$1" ]; then
    >&2 echo "Error: please provide a domain name or URL as argument."
    return 1
  fi
  address=$(echo "$1" | sed -e 's|^[^/]*//||' -e 's|/.*$||')
  openssl s_client -showcerts -connect $address:443 < /dev/null 2>/dev/null | openssl x509 -dates -text -noout | grep -A2 Validity
}

certificate_bundle() {
  openssl crl2pkcs7 -nocrl -certfile "$1" | openssl pkcs7 -print_certs -text -noout
}

# resolve A, then output the reverse DNS (PTR) of that record
# See also: "re" alias below
rere() {
  echo -n "$1: "
  ip=$(dig +short $1)
  if [ -z "$ip" ]; then
    echo "(no A)"
    return 1
  fi
  echo $ip
  echo -n "$ip: "
  reverse=$(dig +short -x $ip)
  if [ -z "$reverse" ]; then
    echo "(no reverse)"
    return 1
  fi
  echo $reverse
}

# open
alias v='vim'
alias vi='vim'
alias vim='vim'
alias b="firefox"

# colors everywhere
alias dir='dir --color=auto'
alias vdir='vdir --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias ip='ip --color'

# colors FUCKING EVERYWHERE
if [ $commands[colormake] ]; then
  alias make='colormake'
fi
if [ $commands[colour-valgrind] ]; then
  alias valgrind='colour-valgrind'
fi

# directory listing
if [ $+commands[exa] ]; then
  alias ls='exa --sort=Name --group-directories-first'
else
  alias ls='ls --color=always --group-directories-first -h'
fi
alias ll='ls -l'
alias l='ll'
if [ $+commands[exa] ]; then
  alias lt='exa --sort=modified --group-directories-first -l'
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
if [[ $XDG_SESSION_TYPE == "wayland" ]]; then
  alias copy='wl-copy -n < '
else
  alias copy='xclip -selection clipboard -i -r'
fi
alias gitroot='cd `git-root`'
alias essh='ssh -O exit'
alias md5='md5sum'
alias sha1='sha1sum'

# misc
alias tree='tree -C'
alias calc='bc'
alias temp='cat /sys/class/thermal/thermal_zone0/temp'
alias week='date +%V'
alias myip='curl https://ip.saumon.io'
alias myip4='curl https://ip4.saumon.io'
alias myip6='curl https://ip6.saumon.io'
alias diskspace='df -P -kHl | grep -v tmpfs | grep -v "dev " | grep -v run'
alias riplaco='ping -i 1.5 8.8.8.8 | grep -E --only-match --color=never "[0-9\.]+ ms"'
alias path='echo $PATH | tr -s ":" "\n"'
alias pp="playerctl play-pause; sleep 0.1; pkill -RTMIN+13 i3blocks"
alias pn="playerctl next; sleep 0.1; pkill -RTMIN+13 i3blocks"
alias ppr="playerctl previous; sleep 0.1; pkill -RTMIN+13 i3blocks"
alias ccat='highlight -O ansi'
alias timestamp='date +%s'
alias beep_disable='xset b off'
alias beep_enable='xset b 100 600 50'
alias i3-info='i3-msg -t get_tree | jq'
alias :q='exit'
alias ipa='ip -brief a'
unalias gs
alias pdfmerge='gs -dNOPAUSE -sDEVICE=pdfwrite -sOUTPUTFILE=combined.pdf -dBATCH'
alias re='dig +short -x'  # reverse DNS PTR

# kitty's kittens
if [ $commands[kitty] ]; then
  alias catimg='kitty +kitten icat'
  alias d='kitty +kitten diff'
  # ripgrep with hyperlinks
  rg() {
    kitty +kitten hyperlinked_grep "$@"
  }
fi

# some versions of watch support color
# but the program you're calling has to send it...
alias watch='watch --color -n1'

alias cal='cal --monday'
