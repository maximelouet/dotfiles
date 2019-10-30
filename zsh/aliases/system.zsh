#
# Saumon ZSH aliases
# system
#

# connect to a wifi network with NetworkManager
wifi() {
  nmcli dev wifi connect "$1" password "$2"
}

# systemctl with sc-*
user_commands=(
  list-units is-active status show help list-unit-files
  is-enabled list-jobs show-environment cat
)

sudo_commands=(
  start stop reload restart try-restart isolate kill
  reset-failed enable disable reenable preset mask unmask
  link load cancel set-environment unset-environment
  edit daemon-reload
)

for c in $user_commands; do alias sc-$c="systemctl $c"; done
for c in $sudo_commands; do alias sc-$c="sudo systemctl $c"; done

# package management
if (( $+commands[yay] )); then
  alias maj='yay -Syu'
  alias majf='yay -Syu --devel --timeupdate'
  alias install='yay -S'
  alias remove='yay -Rn'
  alias remover='yay -Rnsu'
  alias search='yay'
  alias pkclean='paccache -rk 2'
else
  alias maj='sudo apt update && sudo apt dist-upgrade'
  alias install='sudo apt install'
  alias remove='sudo apt remove'
  alias remover='sudo apt remove --purge'
  alias search='sudo apt-cache search'
fi

# arch keyring
alias key-update='sudo rm -rf /etc/pacman.d/gnupg ; sudo pacman-key --init; sudo pacman-key --populate archlinux; sudo pacman -S archlinux-keyring ;sudo pacman-key --refresh'
alias key-add='gpg --recv-key'
key-sign() {
  sudo pacman-key -r "$1"
  sudo pacman-key -f "$1"
  sudo pacman-key --lsign-key "$1"
}

alias restart-compton='killall compton && compton --config ~/.config/compton.conf -b'
