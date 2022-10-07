#!/bin/sh

for file in "$@"; do
  if [ -x "$file" ]; then
    continue
  fi
  basename=$(basename "$file")
  if chmod +x "$file"; then
    notify-send -t 5000 --icon application-x-executable "Mark as executable" "File $basename marked as executable"
  else
    notify-send -u critical "Mark as executable failed" "File $basename could not be marked as executable"
  fi
done
