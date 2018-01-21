#!/bin/sh

notify-send "Locking..." -t 1500 && i3lock \
	-b \
	-e \
	-f \
	--blur 8 \
	--clock \
	--force-clock \
	--timestr="%H:%M" \
	--datestr="" \
	--textcolor="#ffffffdd" \
	--timecolor="#ffffffdd" \
	--timefont="Noto Sans" \
	--timesize=50 \
	--timepos="760:h-400" \
	--veriftext="" \
	--wrongtext="you fucked up" \
	--radius=120 \
	--ringcolor="#32e8c355" \
	--keyhlcolor="#AB47BCff" \
	--bshlcolor="#D32F2Fff" \
	--linecolor="#00000000" \
	--separatorcolor="#00000000" \
	--insidevercolor="#E64A1977" \
	--ringvercolor="#00000000" \
	--insidewrongcolor="#D32F2Fff" \
	--ringwrongcolor="#D32F2Fff"
