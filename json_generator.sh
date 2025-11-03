#!/bin/bash

# This script finds all image files in the current directory and creates a JSON file `img_list.json` containing their names.

# Directory to scan for images. Use "." for the current directory.
IMG_DIR="."
OUTPUT_FILE="img_list.json"

echo "{" > "$OUTPUT_FILE"
echo '  "images": [' >> "$OUTPUT_FILE"
COUNTER=0
IMAGE_FILES=$(find "$IMG_DIR" -maxdepth 1 -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" -o -iname "*.gif" -o -iname "*.webp" \) | sed 's|^\./||' | sort)

NUM_FILES=$(echo "$IMAGE_FILES" | wc -l)

while IFS= read -r file; do
  COUNTER=$((COUNTER + 1))
  if [ "$COUNTER" -eq "$NUM_FILES" ]; then
    echo "    \"$file\"" >> "$OUTPUT_FILE"
  else
    echo "    \"$file\"," >> "$OUTPUT_FILE"
  fi
done <<< "$IMAGE_FILES"

echo "  ]" >> "$OUTPUT_FILE"
echo "}" >> "$OUTPUT_FILE"

echo "✅ Success: '$OUTPUT_FILE' was generated with $NUM_FILES images."