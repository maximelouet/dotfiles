#!/bin/sh
# script appname summary body icon urgency

if [ "$1" = "NetworkManager" ]; then
    pkill -RTMIN+14 i3blocks
fi
