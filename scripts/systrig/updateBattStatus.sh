#!/bin/sh

# This script is triggered by udev when plugging in/out the AC power. This scripts sends an update signal to i3blocks in order to update the battery block

pkill -RTMIN+12 i3blocks
