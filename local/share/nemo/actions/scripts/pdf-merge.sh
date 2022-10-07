#!/bin/sh

date=$(date +%Y-%m-%d_%H-%M-%S)
target_dir=$(dirname "$1")

pdftk "$@" cat output "$target_dir/combined-$date.pdf"
