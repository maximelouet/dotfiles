#!/bin/sh

maim -s "/home/saumon/images/screenshots/$(date +%Y-%m-%d-%H%M%S).png"
notify-send "Screenshot complete!" "Screenshot uploaded to Saumon screenshot service"

#FILE=$(ls -Art /data/images/screenshots/ | tail -n 1) && sh /data/scripts/saumon-upload.sh "/data/images/screenshots/$FILE" && notify-send "Screenshot complete!" "Screenshot uploaded to Saumon screenshot service"
