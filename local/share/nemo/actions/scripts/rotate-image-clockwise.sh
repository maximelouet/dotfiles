#!/bin/bash

for filename in "$@"; do
  if ! [ -f "$filename" ]; then
    continue
  fi
  if ! jpegtran -rotate 90 -trim -copy all "$filename" > "$filename.rotated"; then
    notify-send -u critical "Rotating failed" "jpegtran operation failed for $filename."
  fi
  touch -r "$filename" "$filename.rotated"
  mv "$filename.rotated" "$filename"
done

notify-send -u low "Rotating images finished" "Operation completed."
