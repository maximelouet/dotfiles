[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources
hsetroot -solid "#111111"
exec ssh-agent i3
