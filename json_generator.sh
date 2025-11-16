#!/bin/bash

# Directories to scan for media.
IMG_DIR="./img"
VIDEO_DIR="./videos"
OUTPUT_FILE="random_media_list.json"

MEDIA_FILES=$(find "$IMG_DIR" "$VIDEO_DIR" -type f \( \
  -iname "*.png" -o -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.gif" -o -iname "*.webp" -o -iname "*.svg" \
  -o -iname "*.mp4" -o -iname "*.webm" \
  \) | sed 's|^\./||' | shuf)

# Start JSON file generation
{
  echo "{"
  echo '  "media": ['

  COUNTER=0
  NUM_FILES=$(echo "$MEDIA_FILES" | wc -l)

  # Loop through the shuffled list and add to the JSON file
  while IFS= read -r file; do
    COUNTER=$((COUNTER + 1))
    # Add a comma after each line except the last one
    if [ "$COUNTER" -eq "$NUM_FILES" ]; then
      echo "    \"$file\""
    else
      echo "    \"$file\","
    fi
  done <<< "$MEDIA_FILES"

  echo "  ]"
  echo "}"
} > "$OUTPUT_FILE"

echo "✅ Success: '$OUTPUT_FILE' was generated with $NUM_FILES media files."