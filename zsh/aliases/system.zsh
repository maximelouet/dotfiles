#
# Saumon ZSH aliases
# system: system-specific aliases and functions. Mostly Arch Linux specific.
#

# connect to a wifi network with NetworkManager
wifi() {
  nmcli dev wifi connect "$1" password "$2"
}

# change PIA IP
chip () {
  if ! piactl -t 1 get protocol >/dev/null 2>&1; then
    echo "starting piavpn.service..."
    sudo systemctl start piavpn.service
    sleep 1
  fi
  echo -n "changing IP.."
  piactl disconnect
  piactl connect
  while [[ "$(piactl get connectionstate)" != "Connected" ]]; do echo -n '.'; sleep 1; done
  echo
  curl --retry 2 ip.saumon.io
}

dns_from_the_fucking_network_im_connected_to() {
  dns_normal "silent"
  found=$(sudo dhcpcd -T wlp2s0 2> /dev/null)
  dns_servers=$(echo "$found" | grep "new_domain_name_servers" | cut -d "'" -f 2)
  if [[ -z "$dns_servers" ]]; then
    >&2 echo "No DNS servers found. dhcpcd reply:"
    >&2 echo $found
    return 1
  fi
  dns_server=$(echo $dns_servers | awk '{ print $1 }')
  sudo sed -i "1s/^/nameserver $dns_server # TMP dhcp_dns\n/" /etc/resolv.conf
  echo "Added $dns_server as the first nameserver in /etc/resolv.conf"
  echo "Run dns_normal at any time to remove this entry."
}

dns_normal() {
  sudo sed -i '/TMP dhcp_dns/d' /etc/resolv.conf
  if [[ -z "$1" ]]; then
    cat /etc/resolv.conf
  fi
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
  alias maj='yay -Syu ; pkill -RTMIN+15 i3blocks > /dev/null 2>&1'
  alias majf='yay -Syu --devel --timeupdate ; pkill -RTMIN+15 i3blocks > /dev/null 2>&1'
  alias install='yay -S'
  alias remove='yay -Rn'
  alias remover='yay -Rnsu'
  alias search='yay'
  alias pkclean='paccache -rk 2'
elif (( $+commands[pacman] )); then
  alias maj='sudo pacman -Syu ; pkill -RTMIN+15 i3blocks'
  alias install='sudo pacman -S'
  alias remove='sudo pacman -Rn'
  alias remover='sudo pacman -Rns'
  alias search='sudo pacman -Q'
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

alias restart-picom='killall picom && picom -b'

alias reboot-windows='systemctl reboot --boot-loader-entry auto-windows'
alias reboot-to-windows='systemctl reboot --boot-loader-entry auto-windows'
alias reboot-bios='systemctl reboot --boot-loader-entry auto-reboot-to-firmware-setup'
alias reboot-to-bios='systemctl reboot --boot-loader-entry auto-reboot-to-firmware-setup'
