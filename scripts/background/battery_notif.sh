#!/bin/sh

battInfo=$(acpi)
battStatus=$(echo $battInfo | awk '/ / {print $3}' | tr -d ',')
battCapacity=$(echo $battInfo | awk '/ / {print $4}' | tr -d '%,\n')
battRemain=$(echo $battInfo | awk '/ / {print $5}' | sed 's/...$//' | tr -d '\n')

if [ \( "$battStatus" != "Charging" \) ]; then
	if [ $battCapacity -lt "20" ]; then
		notify-send -u critical 'Very low battery' --icon=battery-caution
	elif [ $battCapacity -lt "40" ]; then
		notify-send 'Low battery' --icon=battery-low
	fi
fi
