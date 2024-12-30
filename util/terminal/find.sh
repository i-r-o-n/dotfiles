#!/bin/bash

if [ $# -ne 2 ]; then
  echo "Usage: $0 file1 file2"
  echo "Searches for lines from file1 as substrings in file2 (case-insensitive)"
  exit 1
fi

fa=$1
fb=$2

if [ ! -f "$fa" ] || [ ! -f "$fb" ]; then
  echo "Error: both files must exist"
  exit 1
fi

while IFS= read -r search_string; do
  if [ -n "$search_string" ]; then
    echo "Searching for: $search_string"
    grep -i "$search_string" "$fa"
  fi
done <"$fb"
