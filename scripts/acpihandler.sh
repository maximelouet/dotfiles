#!/bin/bash

# Saumon ACPI actions

case "$1" in
    button/power)
        sudo -u saumon /data/Scripts/lock.sh
        echo -n mem >/sys/power/state
        ;;
    button/sleep)
        sudo -u saumon /data/Scripts/lock.sh
        echo -n mem >/sys/power/state
        ;;
    ac_adapter)
        pkill -RTMIN+12 i3blocks
        ;;
    jack/headphone)
        pkill -RTMIN+10 i3blocks
        ;;
esac

# vim:set ts=4 sw=4 ft=sh et:
