#!/bin/bash

ASSET_ID=$1
ASSET_FILE="Assets/$ASSET_ID.txt"
OVERLAY_FILE="Assets/${ASSET_ID}_overlay.txt"
TRACE_LOG=".audit/trace.log"
ENV_LOG=".audit/env_trace.log"
MANIFEST_FILE="ResaleDrops/${ASSET_ID}_manifest.zip"

echo "🔍 Verifying manifest for $ASSET_ID"

# Check asset file
if [ ! -f "$ASSET_FILE" ]; then
  echo "❌ Missing asset file: $ASSET_FILE"
  exit 1
fi

# Check overlay file
if [ ! -f "$OVERLAY_FILE" ]; then
  echo "❌ Missing overlay file: $OVERLAY_FILE"
  exit 1
fi

# Check audit logs
if [ ! -f "$TRACE_LOG" ] || [ ! -f "$ENV_LOG" ]; then
  echo "❌ Missing audit logs"
  exit 1
fi

# Check manifest zip
if [ ! -f "$MANIFEST_FILE" ]; then
  echo "❌ Manifest not found: $MANIFEST_FILE"
  exit 1
fi

# Confirm overlay format
if ! grep -q "Overlay Format: branded" "$OVERLAY_FILE"; then
  echo "⚠️ Overlay format not branded"
  exit 1
fi

echo "✅ Manifest verified for $ASSET_ID"
echo "[$(date)] VERIFY: $ASSET_ID | Status=verified" >> .audit/trace.log
