#!/usr/bin/env bash

# Error 1 = No arguments passed
if (( $# == 0 )); then
  echo "Error: You have not entered any file as argument."
  exit 1
fi

file_name="$1"

# Error 2 = No file with this name exists.
if [[ ! -f "$file_name" ]]; then
  echo "Error: File '$file_name' not found."
  exit 2
fi

#Error 3 = More than one file entered
if (( $# > 1)); then
  echo "Error: Please pass only one file as input."
  exit 3
fi

#Error 4 = Non text file entered as argument
if [[ "$file_name" != *.txt ]]; then
  echo "Error: Please enter a file with .txt extension."
  exit 4
fi

echo "'$file_name'under watch. Press CTRL+C to stop."

# Initial word count
prev_word_count=$(wc -w < "$file_name")

while true; do
  # Current word count
  current_word_count=$(wc -w < "$file_name")

  # If the new word count is different from teh previous word count, then update word count in the terminal.
  if [[ "$current_word_count" -ne "$prev_word_count" ]]; then
    echo "Word Count = $current_word_count"
    prev_word_count=$current_word_count
  fi

  # Sleep 1 sec
  sleep 1
done
