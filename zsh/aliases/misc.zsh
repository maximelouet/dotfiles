#
# Saumon ZSH aliases
# misc
#

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
alias weather='curl wttr.in'
alias moon='curl wttr.in/Moon'

# prevent screen from locking or going off, and disable redshift
cinema() {
  killall redshift
  killall xautolock
  xset -dpms
  xset s noblank
  xset s off
}
