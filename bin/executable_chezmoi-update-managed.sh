#!/usr/bin/env bash

managed_files=$(chezmoi managed -i files -p absolute)

while IFS= read -r file; do
    echo "Updating: ${file}"
    chezmoi add "$file"
done <<< "$managed_files"

echo "DONE"
