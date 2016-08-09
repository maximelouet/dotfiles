#!/bin/sh

export DISPLAY=:0

img=/tmp/screenlock.png

scrot $img
convert $img -level 0%,100% \
	-gamma 0.4,0.35,0.35 \
	-filter Gaussian -resize 20% -define filter:sigma=0.5 -resize 500% \
	-font "Noto-Sans" -pointsize 40 -gravity center \
	-annotate +0+140 'Jean Pierre Foucault' -blur 0x3 \
	-fill white -annotate +0+139 'Jean Pierre Foucault' \
	/home/saumon/static/icons/lock.png -gravity center -composite \
	$img

i3lock -f -i $img

