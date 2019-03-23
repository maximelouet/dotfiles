[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources
exec ssh-agent i3
