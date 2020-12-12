#
# Saumon ZSH aliases
# epitech: epilol-specific aliases
#

# prepare an epitech repo
prepus() {
  blih -u "$TEKLOGIN" repository create "$1"
  blih -u "$TEKLOGIN" repository setacl "$1" ramassage-tek r
  git clone "git@git.epitech.eu:/$TEKLOGIN/$1" "$1"
  cd "$1" || return
  git commit -m "Initial commit" --allow-empty
  git push
}

# useful epitech repo commands
repo() {
  case "$1" in
    prepare)
      blih -u "$TEKLOGIN" repository create "$2"
      blih -u "$TEKLOGIN" repository setacl "$2" ramassage-tek r
      git clone "git@git.epitech.eu:/$TEKLOGIN/$2" "$2"
      cd "$2"
      git commit -m "Initial commit" --allow-empty
      git push
      ;;
    create)
      blih -u "$TEKLOGIN" repository create "$2"
      ;;
    list)
      blih -u "$TEKLOGIN" repository list | sort
      ;;
    delete)
      blih -u "$TEKLOGIN" repository delete "$2"
      ;;
    getacl)
      blih -u "$TEKLOGIN" repository getacl "$2"
      ;;
    setacl)
      blih -u "$TEKLOGIN" repository setacl "$2" "$3" "$4"
      ;;
    clone)
      git clone "git@git.epitech.eu:/$TEKLOGIN/$2"
      ;;
  esac
}

# reset escape and ne aliases for noobs
alias_noob() {
  setxkbmap -option
  alias ne="emacs -nw"
}

# re-set escape and ne aliases for saumon
alias_saumon() {
  setxkbmap -option caps:swapescape
  alias ne="sudo vim /etc/nginx/nginx.conf"
}

alias emacs='emacs -nw'
alias blih="blih -u $TEKLOGIN"
alias norman='python2 /data/scripts/norman.py -nocheat -verbose -return -printline -score '
