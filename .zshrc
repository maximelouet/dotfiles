# Saumon

export TERM="xterm-256color"
export DEFAULT_USER=saumon

export EDITOR='vim'
export MANPAGER='most'
export VISUAL='vim'
export PAGER='most'
export BROWSER='firefox'

alias vi='vim'



user_commands=(
  list-units is-active status show help list-unit-files
  is-enabled list-jobs show-environment cat)

sudo_commands=(
  start stop reload restart try-restart isolate kill
  reset-failed enable disable reenable preset mask unmask
  link load cancel set-environment unset-environment
  edit)

for c in $user_commands; do; alias sc-$c="systemctl $c"; done
for c in $sudo_commands; do; alias sc-$c="sudo systemctl $c"; done




up(){
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

function saumon_wifiregister() {
	#if [[ $UID != 0 && $EUID != 0 ]]; then
	#	echo "You must be root !"
	#	return 1
	#fi
	if [[ "$#" -ne 3 ]]; then
		echo "Usage: saumon_wifiregister NAME SSID PASS" >&2
		return 1
	fi
	echo "Description='Saumon auto-generated WiFi config for network \"$1\"'" > /home/saumon/static/tempconf/netctl/$1
	echo "Interface=wlp3s0" >> /home/saumon/static/tempconf/netctl/$1
	echo "Connection=wireless" >> /home/saumon/static/tempconf/netctl/$1
	echo "Security=wpa" >> /home/saumon/static/tempconf/netctl/$1
	echo "IP=dhcp" >> /home/saumon/static/tempconf/netctl/$1
	echo "ESSID=$2" >> /home/saumon/static/tempconf/netctl/$1
	crypted=$(wpa_passphrase $2 $3 | sed -e '/[^#]psk=/!d' | sed -e 's/^\s*psk=\(.*\)$/\1/' | sed -e 's/\n//') 
	echo "Key=\\\"$crypted" >> /home/saumon/static/tempconf/netctl/$1
	sudo mv /home/saumon/static/tempconf/netctl/$1 /etc/netctl/
	sudo netctl start $1
}

cx() { sudo chmod +x $* }


live(){
	screen -dmS live livestreamer twitch.tv/monstercat audio && printf "\nStarted Monstercat FM in hidden screen. Type 'screen -r live' to get the output.\n\n"
}
rg() {
    if [ -z "$RANGER_LEVEL" ]
    then
        ranger
    else
        exit
    fi
}

ly(){
    cat /data/Lyrics/*"$*"*;
}
backup_server() {
    echo "Backing up /var/www...";
    sleep 1;
    now=$(date +"%Y%m%d%H%M%S");
    XZ_OPT=-9 tar cJvf /mnt/usb/BACKUP/Server/$now.tar.xz /var/www/*;
    echo "Backup of /var/www completed to /mnt/usb/BACKUP/Server/$now.tar.xz";
}


alias ls='ls --group-directories-first --color=auto -h'
alias dir='dir --color=auto'
alias vdir='vdir --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias screen='screen -U'
alias maj='yaourt -Syua'
alias install='yaourt -S'
alias remove='yaourt -Rns'
alias tree='tree -C'
alias rm='rm -I'
alias l='ls'
alias la='ls -A'
alias ll='ls -lh'
alias e='expr'
alias calc='bc'
alias ne='emacs -nw'
alias u='up && ls'
alias fucking='sudo'
alias temp='cat /sys/class/thermal/thermal_zone0/temp'

alias whyami='echo "Ask your mom"'
alias putain='echo "Wesh ta gueule"'
alias bonsoir='echo "Bonsoir."'
alias mama='echo "Mama ?"'
alias wtf='dmesg'
alias update-grub='sudo grub-mkconfig -o /boot/grub/grub.cfg'
alias song='curl http://cigix.noip.me/update.php; echo'
alias apt-get='echo "pauvre bite";:'
alias gti='echo "pauvre merde\n";git'

c() { cd "$@" && ls; }


eval $(keychain -q --eval main github)

source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"

unalias sl
