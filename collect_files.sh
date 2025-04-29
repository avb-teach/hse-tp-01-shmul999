#!/bin/bash

input_dir = "$1"
output_dir = "$2"

find "$input_dir" -type f | while read -r file; do
    name=$(basename "$file")
    
    place="$output_dir/$name"

    cp "$file" "$place"
done
