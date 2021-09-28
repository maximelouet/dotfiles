#/bin/sh

info=$(exiv2 -g Exif.Photo.DateTimeOriginal -P v print "$1")

if [ -z "$info" ]; then
  zenity \
    --error \
    --title "$1" \
    --text "No EXIF DateTime found for this image." \
    --ok-label "Close" \
    --ellipsize
else
  zenity \
    --info \
    --title "$1" \
    --icon-name emblem-photos \
    --text "EXIF DateTime:\n$info" \
    --ok-label "Close" \
    --ellipsize
fi
