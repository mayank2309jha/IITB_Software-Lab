#!/usr/bin/env bash

# Error 1: No arguments passed
if (( $# == 0 )); then
  echo "Error: No argument found. Please pass a folder with images as the argument."
  exit 1
fi

dir="$1"

# Error 2: Directory does not exist
if [[ ! -d "$dir" ]]; then
  echo "Error: Directory, '$dir' does not exist."
  exit 2
fi

cd "$dir" || exit 3

images=( *.jpg *.jpeg *.png ) #Create an array of all the images with these extensions.

# Error 3: No image files found
if (( ${#images[@]} == 0 )); then
  echo "Error: No image files found in the directory '$dir'."
  exit 4
fi

echo "Checking for duplicate images in '$dir'..."

# Generate checksums and delete duplicates
md5sum "${images[@]}" 2>/dev/null |
  awk '
  {
    checksum=$1
    image_name=$2
    image_list[checksum]=image_list[checksum]" "image_name
    count_images[checksum]++
  }
  END {
    for (img in count_images) {
      if (count_images[img] > 1) {
        split(image_list[img], array)
        print "Duplicate group (hash: " img "):"
        for (i=1; i<=length(array); i++) {
          if (i == 1) {
            print "  Keeping: " array[i]
          } else {
            print "  Deleting: " array[i]
            system("rm -f \"" array[i] "\"")
          }
        }
      }
    }
  }'
