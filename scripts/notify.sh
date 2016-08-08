#!/bin/sh

# Notify script useful for displaying notifications to the user when DISPLAY is not set. Mostly used for testing purposes

export DISPLAY=:0
title=${1-Nothing}
body=${2-This is nothing}

notify-send "$title" "$body"
