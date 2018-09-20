#!/bin/sh

set -e

sudo ls > /dev/null 2>&1
echo "Resetting files and disabling NTP..."
sudo timedatectl set-timezone UTC
sudo rm -f /etc/localtime
sudo rm -f /etc/adjtime
sudo timedatectl set-ntp false
sudo timedatectl set-local-rtc 0
sudo timedatectl set-timezone Europe/Paris
echo "Getting time from Saumon's server..."
curtime=$(curl -s 'https://saumon.io/time')
echo -n "Current date: "
sudo date -s "$curtime"
sudo hwclock -w
echo "Done!"
