#!/bin/sh

export DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/1000/bus

battInfo=$(acpi)
battStatus=$(echo $battInfo | awk '/ / {print $3}' | tr -d ',')
battCapacity=$(echo $battInfo | awk '/ / {print $4}' | tr -d '%,\n')
battRemain=$(echo $battInfo | awk '/ / {print $5}' | sed 's/...$//' | tr -d '\n')

if [ \( "$battStatus" != "Charging" \) ]; then
	if [ $battCapacity -lt "20" ]; then
		notify-send -u critical "Very low battery" "($battCapacity%)" --icon=battery-caution
	elif [ $battCapacity -lt "40" ]; then
		notify-send "Low battery" "($battCapacity%)" --icon=battery-low
	fi
fi
