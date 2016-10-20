#!/bin/sh

export DISPLAY=:0
xlock -mode matrix -timeout 5 -bg black -fg white -username "User: " -info " " -validate "Hold on..." -invalid "Nope ! " -delay 7000 +description +showdate
