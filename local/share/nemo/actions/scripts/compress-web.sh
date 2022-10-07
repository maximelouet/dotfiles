#!/bin/bash

for filename in "$@"; do
  if [ -z "$filename" ] || [ ! -e "$filename" ]; then
    continue
  fi
  basename=$(basename "$filename")
  id=$(dunstify --printid --timeout 200000 -u low --icon camera "Compressing for Web" "Compressing $basename...")
  if [ -d "$filename" ]; then
    new_filename="$filename"_web
  else
    new_filename="${filename%.*}_web.${filename##*.}"
  fi
  cp -r "$filename" "$new_filename"
  if "$HOME/scripts/photo/compress-web.sh" "$new_filename"; then
    dunstify --replace="$id" --timeout 5000 --icon camera "Compression finished" "Web compression succeeded for $basename"
  else
    dunstify --replace="$id" -u critical "Compression failed" "compress-web.sh exited with error for $basename"
  fi
done
