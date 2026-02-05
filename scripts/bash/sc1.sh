#!/bin/bash
File="$1"
Limit=1048576

if [ -z  "$File" ]; then
  echo “Error: no input”
  exit 1
fi 

if [ ! -f  "$File" ]; then
  echo “Error: file not found”
  exit 1
fi

file_size=$(stat -c%s "$File")

if [ "$file_size" -gt "$Limit" ]; then
  echo “File is too large.”
  exit 0
fi 

echo "File is within limits."

