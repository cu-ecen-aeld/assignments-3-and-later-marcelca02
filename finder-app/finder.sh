#!/bin/bash

FILES_DIR=$1
SEARCH_STR=$2

if [[ -z "$FILES_DIR" || -z "$SEARCH_STR" ]]; then
	echo "Arguments missing. Usage $0 <filesdir> <searchstr>"
	exit 1
fi

if [[ ! -d "$FILES_DIR" ]]; then
	echo "Error: "$FILES_DIR" is not a valid directory."
	exit 1
fi

num_files=$(find "$FILES_DIR" -type f | wc -l)
num_matches=$(grep -r "$SEARCH_STR" "$FILES_DIR" 2>/dev/null | wc -l)

echo "The number of files are $num_files and the number of matching lines are $num_matches"
