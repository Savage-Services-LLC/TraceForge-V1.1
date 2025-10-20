#!/bin/bash

ASSET_ID=$1
ASSET_FILE="Assets/$ASSET_ID.txt"
OVERLAY_FILE="Assets/${ASSET_ID}_overlay.txt"
MANIFEST_DIR="ResaleDrops"
MANIFEST_FILE="$MANIFEST_DIR/${ASSET_ID}_manifest.zip"

# Ensure manifest directory exists
mkdir -p "$MANIFEST_DIR"

# Validate required files
if [ ! -f "$ASSET_FILE" ]; then
  echo "❌ Missing asset file: $ASSET_FILE"
  exit 1
fi

if [ ! -f "$OVERLAY_FILE" ]; then
  echo "❌ Missing overlay file: $OVERLAY_FILE"
  exit 1
fi

# Create manifest bundle
zip -j "$MANIFEST_FILE" "$ASSET_FILE" "$OVERLAY_FILE" .audit/trace.log .audit/env_trace.log

# Log manifest creation
echo "[$(date)] MANIFEST: $ASSET_ID | Bundle=$MANIFEST_FILE | Status=ready" >> .audit/trace.log

echo "✅ Manifest created → $MANIFEST_FILE"
