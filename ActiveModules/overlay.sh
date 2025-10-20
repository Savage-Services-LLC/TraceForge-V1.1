#!/bin/bash

ASSET_ID=$1
ASSET_FILE="Assets/$ASSET_ID.txt"
OVERLAY_FILE="Assets/${ASSET_ID}_overlay.txt"

echo "🧩 Injecting overlay for $ASSET_ID"

# Validate asset file
if [ ! -f "$ASSET_FILE" ]; then
  echo "❌ Asset file not found: $ASSET_FILE"
  exit 1
fi

# Extract metadata
GRADE=$(grep "grade=" "$ASSET_FILE" | cut -d= -f2)
TYPE=$(grep "type=" "$ASSET_FILE" | cut -d= -f2)
ORIGIN=$(grep "origin=" "$ASSET_FILE" | cut -d= -f2)
NOTES=$(grep "notes=" "$ASSET_FILE" | cut -d= -f2)

# Build overlay
echo "🔧 TraceForge-V1.2 Overlay" > "$OVERLAY_FILE"
echo "Asset ID: $ASSET_ID" >> "$OVERLAY_FILE"
echo "Type: $TYPE" >> "$OVERLAY_FILE"
echo "Salvage Grade: $GRADE" >> "$OVERLAY_FILE"
echo "Origin: $ORIGIN" >> "$OVERLAY_FILE"
echo "Notes: $NOTES" >> "$OVERLAY_FILE"
echo "Overlay Format: branded" >> "$OVERLAY_FILE"

# Log overlay injection
echo "[$(date)] OVERLAY: $ASSET_ID | Grade=$GRADE | Type=$TYPE | Overlay=$OVERLAY_FILE" >> .audit/trace.log

echo "✅ Overlay injected → $OVERLAY_FILE"
