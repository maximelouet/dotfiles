#!/bin/bash

# Saumon ACPI actions

lockcommand="xautolock -locknow"

case "$1" in
    button/power)
        case "$2" in
            PBTN|PWRF)
                sudo -u saumon $lockcommand
                echo -n mem >/sys/power/state
                ;;
        esac
        ;;
    button/sleep)
        case "$2" in
            SLPB|SBTN)
                sudo -u saumon $lockcommand
                echo -n mem >/sys/power/state
                ;;  
        esac
        ;;
    ac_adapter)
        pkill -RTMIN+12 i3blocks
        ;;
    jack/headphone)
        pkill -RTMIN+10 i3blocks
        ;;
esac

# vim:set ts=4 sw=4 ft=sh et:
