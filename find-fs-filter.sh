#!/bin/bash

# Prompt user for the target URL
read -p "Enter the target website (e.g., http://example.com): " TARGET

if [ -z "$TARGET" ]; then
  echo "Error: No website entered. Please try again."
  exit 1
fi

echo "[*] Finding FS Filter for $TARGET..."
echo "[*] Sending test requests to analyze response sizes."

# Send test requests and capture response sizes
SIZE1=$(curl -s -o /dev/null -w "%{size_download}" "$TARGET/doesnotexist123")
SIZE2=$(curl -s -o /dev/null -w "%{size_download}" "$TARGET/")
SIZE3=$(curl -s -o /dev/null -w "%{size_download}" "$TARGET/randompath456")

echo "[*] Response sizes:"
echo "Non-existent path 1: $SIZE1 bytes"
echo "Homepage: $SIZE2 bytes"
echo "Non-existent path 2: $SIZE3 bytes"

# Identify the most common response size (likely irrelevant paths)
COMMON_SIZE=$SIZE1
if [ "$SIZE2" -eq "$SIZE1" ] || [ "$SIZE2" -eq "$SIZE3" ]; then
  COMMON_SIZE=$SIZE2
elif [ "$SIZE3" -eq "$SIZE1" ]; then
  COMMON_SIZE=$SIZE3
fi

echo "[*] Most common response size: $COMMON_SIZE bytes"
echo "[*] Use this as your FS Filter: -fs $COMMON_SIZE"
