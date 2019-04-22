[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources
hsetroot -solid black
exec ssh-agent i3
