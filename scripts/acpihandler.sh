#!/bin/bash

# Saumon's acpi script that takes an entry for all actions

case "$1" in
    button/power)
        case "$2" in
            PBTN|PWRF)
                sudo -u saumon /data/Scripts/lock.sh
                echo -n mem >/sys/power/state
                ;;
        esac
        ;;
    button/sleep)
        case "$2" in
            SLPB|SBTN)
                sudo -u saumon /data/Scripts/lock.sh
                echo -n mem >/sys/power/state
                ;;
        esac
        ;;
    ac_adapter)
        case "$2" in
            AC|ACAD|ADP0|ACPI0003:00)
                case "$4" in
                    00000000) # unplugged
                        pkill -RTMIN+12 i3blocks
                        ;;
                    00000001) # plugged
                        pkill -RTMIN+12 i3blocks
                        ;;
                esac
                ;;
        esac
        ;;
    jack/headphone)
        case "$2" in
            HEADPHONE)
                pkill -RTMIN+10 i3blocks
                ;;
        esac
        ;;
    button/lid)
        case "$3" in
            close)
                logger 'LID closed'
                ;;
            open)
                logger 'LID opened'
                ;;
    esac
    ;;
esac

# vim:set ts=4 sw=4 ft=sh et:
