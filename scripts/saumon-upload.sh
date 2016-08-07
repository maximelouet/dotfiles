#!/bin/bash

if [ -z "$1" ]
then
  echo "Specify a file to be uploaded"
  exit 2
elif ! [ -f "$1" -a -r "$1" ]
then
  echo "File '$1' is not valid (it is not a file or it is not readable)"
  exit 3
fi

curl "https://s.maximelouet.me/up" -# -F "auth=MYAUTH" -F "file=@$1" | xclip -i -selection clipboard

