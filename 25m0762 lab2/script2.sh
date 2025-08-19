#!/usr/bin/env bash

# Error 1: No arguments passed
if (( $# == 0 )); then
  echo "Error: You did not pass the directory as an argument. For example, $0 images"
  exit 1
fi

# Error 2: Directory does not exist
dir="$1"  
if [[ ! -d "$dir" ]]; then
  echo "Error: Directory '$dir' not found!"
  exit 2
fi

# Error 3: Cannot enter the directory
cd "$dir" || exit 3

shopt -s nullglob # Even if no .jpg exist, *jpg will not be treated like a literal string.
files=(*.jpg *.jpeg *.png)

# Error 4: No images in the directory
if (( ${#files[@]} == 0 )); then
  echo "Error: No images (JPEG/PNG) found in '$dir'."
  exit 4
fi

# Announce processing step
echo "Found ${#files[@]} image(s). Renaming in timestamp order..."

# Sort files by timestamp, ascending order.
sorted_files=($(ls -1tr *.jpg *.jpeg *.png 2>/dev/null))  

# Sequential renaming
count=1 
for file in "${sorted_files[@]}"; do 
  extension="${file##*.}"  # Catch the extension
  newname="${count}.${extension}" # Name of the new image
  if [[ -e "$newname" ]]; then # If the image exists already
    echo "$newname already exists. No action."  
  else
    mv -- "$file" "$newname" # Rename the file to newname
    # echo "Renamed: $file -> $newname" # Announce the change
  fi
  ((count++)) #Modify the count
done

echo "Renaming complete. Images are now sequentially numbered."