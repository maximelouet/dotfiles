#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

SELECT="if [ \$? = 0 ]; then echo \"\[\e[92m\]>\"; else echo \"\[\e[91m\](\$?) >\"; fi"
PS1="\[\e[0m\e[92m\]\u\[\e[0m\e[96m\]@\[\e[92m\]\h \[\e[0m\e[36m\]\w\[\e[1m\] \`${SELECT}\`\[\e[0m\] "

shopt -s autocd
export EDITOR=vim
export CDPATH=$CDPATH:/data:~

up(){
	local d=""
	limit=$1
	for ((i=1 ; i <= limit ; i++))
		do
		d=$d/..
		done
	 d=$(echo $d | sed 's/^\///')
 	 if [ -z "$d" ]; then
		 d=..
 	 fi
	 cd $d
}
live(){
	screen -dmS live livestreamer twitch.tv/monstercat audio && printf "\nStarted Monstercat FM in hidden screen. Type 'screen -r live' to get the output.\n\n"
}
c() { cd "$@" && ls; }


eval "$(thefuck --alias)"

alias ls='ls --color=auto -h'
alias dir='dir --color=auto'
alias vdir='vdir --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias screen='screen -U'
alias tree='tree -C'
alias t='tree'
alias rm='rm -I'
alias l='ls'
alias ll='ls -a'
