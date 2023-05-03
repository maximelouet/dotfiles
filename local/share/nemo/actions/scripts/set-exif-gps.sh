#!/bin/bash

source_file=$(zenity --title="Use this file as location source" --file-selection)

if [ -z "$source_file" ]; then
  exit 1
fi

if ! "$HOME/scripts/photo/set-exif-gps.sh" "$source_file" "$@"; then
  notify-send -u critical "Set EXIF GPS failed" "Script exited with non-zero status."
  exit 1
fi

enotify-send -u low "Set EXIF GPS" "EXIF location changed successfully for the selected files."
