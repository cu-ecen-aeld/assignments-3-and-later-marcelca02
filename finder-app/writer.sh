#!/bin/bash

WRITE_FILE=$1
WRITE_STR=$2


if [[ -z "$WRITE_FILE" || -z "$WRITE_STR" ]]; then
	echo "Arguments missing. Usage $0 <writefile> <writestr>"
        exit 1
fi

mkdir -p "$(dirname "$WRITE_FILE")"
touch "$WRITE_FILE"
echo "$WRITE_STR" >> "$WRITE_FILE" 

