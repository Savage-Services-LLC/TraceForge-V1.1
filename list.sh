#!/bin/bash

ASSET_DIR="Assets"
MANIFEST_DIR="ResaleDrops"

echo "📋 TraceForge-V1.2 Asset Listing"
echo "--------------------------------"

for FILE in "$ASSET_DIR"/*.txt; do
  # Skip overlay files
  [[ "$FILE" == *_overlay.txt ]] && continue

  ASSET_ID=$(basename "$FILE" .txt)
  GRADE=$(grep "grade=" "$FILE" | cut -d= -f2)
  TYPE=$(grep "type=" "$FILE" | cut -d= -f2)

  OVERLAY_FILE="${ASSET_DIR}/${ASSET_ID}_overlay.txt"
  MANIFEST_FILE="${MANIFEST_DIR}/${ASSET_ID}_manifest.zip"

  OVERLAY_STATUS="❌"
  MANIFEST_STATUS="❌"

  [ -f "$OVERLAY_FILE" ] && OVERLAY_STATUS="✅"
  [ -f "$MANIFEST_FILE" ] && MANIFEST_STATUS="✅"

  echo "🔹 $ASSET_ID | Type=$TYPE | Grade=$GRADE | Overlay=$OVERLAY_STATUS | Manifest=$MANIFEST_STATUS"
done
