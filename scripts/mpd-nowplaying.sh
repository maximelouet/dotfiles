#!/bin/sh
display_song() {
    status=
    color=
    case $(mpc status | sed 1d | head -n1 | awk '{ print $1 }') in
    '[playing]')
        status=
        color='#36a8d5'
        ;;
    '[paused]')
        status=
        color=
        ;;
    esac
    i3cat encode --name mpd --instance "now playing" --color "${color}" " ${status} $1"
}

on_click_event() {
    button=$(echo $@ | i3cat decode button)
    case $button in
    1)
	i3-msg '[con_mark="terminal"]' focus > /dev/null
        ;;
    esac
}

(while :; do
    display_song "$(mpc current --wait)"
done) &

(while :; do
    display_song "$(mpc current)"
    mpc idle player > /dev/null
done) &

cat | while read line; do on_click_event "$line"; done
