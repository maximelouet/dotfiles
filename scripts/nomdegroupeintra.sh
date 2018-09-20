#!/bin/sh

while true; do
	curl -4 -L -sS -r 0-199 "https://fr.wikipedia.org/wiki/Sp%C3%A9cial:Page_au_hasard" | perl -l -0777 -ne 'print $1 if /<title.*?>\s*(.*?)\s*— Wikipédia<\/title/si'
done
