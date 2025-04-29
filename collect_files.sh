#!/bin/bash
input_dir="$1"
output_dir="$2"

find "$input_dir" -type f | while read -r file; do
    name=$(basename "$file")
    place="$output_dir/$name"
    counter = 1
    while [ -e "$place" ]; do
        full="${name##*.}"
        not_full="${name%.*}"
        if [ "$full" = "$not_full" ]; then
            place="$output_dir/${not_full}_$counter"
        else
            place="$output_dir/${not_full}_$counter.$full"
        fi
        ((counter++))
    done
    cp "$file" "$place"
done
