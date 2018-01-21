#!/bin/sh

while true; do
  wget -4 -qO- "https://fr.wikipedia.org/wiki/Sp%C3%A9cial:Page_au_hasard" | perl -l -0777 -ne 'print $1 if /<title.*?>\s*(.*?)\s*— Wikipédia<\/title/si'
done
