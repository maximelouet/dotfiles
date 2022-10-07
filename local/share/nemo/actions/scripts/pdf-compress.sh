#!/bin/bash

target_dir=$(dirname "$1")
basename=$(basename "$1")

gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/ebook -dNOPAUSE -dQUIET -dBATCH -sOutputFile="$target_dir/${basename/.pdf/}_compressed.pdf" "$1"
