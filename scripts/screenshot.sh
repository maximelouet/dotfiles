#!/bin/sh

maim -s "/data/Images/Screenshots/$(date +%Y-%m-%d-%H%M%S).png" && FILE=$(ls -Art /data/Images/Screenshots/ | tail -n 1) && sh /home/saumon/scripts/saumon-upload.sh "/data/Images/Screenshots/$FILE" && notify-send "Screenshot complete!" "Screenshot uploaded to Saumon screenshot service"

