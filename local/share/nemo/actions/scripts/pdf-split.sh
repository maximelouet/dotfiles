#!/bin/bash

target_dir=$(dirname "$1")
basename=$(basename "$1")

pdftk "$1" burst output "$target_dir/${basename/.pdf/}""_page_%02d.pdf"

find "$target_dir" -maxdepth 1 -mtime -1 -name "doc_data.txt" -delete
