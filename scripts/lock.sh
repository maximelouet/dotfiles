#!/bin/sh

notify-send "Locking..." -t 1500 && i3lock \
	-b \
	-e \
	-f \
	-p win \
	-i /home/saumon/images/bsol.png
