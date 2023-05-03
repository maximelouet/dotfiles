#!/bin/bash

datetime=$(zenity --entry --title="Set EXIF datetime" --text="Enter a touch-parsable datetime string:")

if [ -z "$datetime" ]; then
  exit 1
fi

if ! touch -d "$datetime" "$@"; then
  notify-send -u critical "Set EXIF datetime failed" "Touch operation failed."
  exit 1
fi


datetime_formatted=$(date +"%Y-%m-%d %H:%M:%S" -r "$1")

if ! exiv2 -M "set Exif.Photo.DateTimeOriginal \"$datetime_formatted\"" "$@"; then
  notify-send -u critical "Set EXIF datetime failed" "exiv2 operation failed."
  exit 1
fi

exiv2 -T rename "$@"

notify-send -u low "Set EXIF datetime" "Datetime changed successfully to $datetime_formatted."
