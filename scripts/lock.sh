#!/bin/sh

img=/tmp/screenlock.png

scrot $img
convert $img -level 0%,100%,0.4 \
	-filter Gaussian -resize 20% -define filter:sigma=1.5 -resize 500.5% \
	-font "Noto-Sans" -pointsize 40 -gravity center \
	-annotate +0+140 'Jean Pierre Foucault' -blur 0x4 \
	-fill white -annotate +0+138 'Jean Pierre Foucault' \
	/home/saumon/static/icons/lock.png -gravity center -composite \
	$img

i3lock -n -i $img

