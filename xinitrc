[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources
xsetroot -solid black
exec ssh-agent i3
