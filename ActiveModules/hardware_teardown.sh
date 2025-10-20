#!/bin/bash

ASSET_ID=$1
ASSET_FILE="Assets/$ASSET_ID.txt"

echo "🔧 Running teardown for $ASSET_ID"

# Validate asset file
if [ ! -f "$ASSET_FILE" ]; then
  echo "❌ Asset file not found: $ASSET_FILE"
  exit 1
fi

# Parse asset metadata
GRADE=$(grep "grade=" "$ASSET_FILE" | cut -d= -f2)
TYPE=$(grep "type=" "$ASSET_FILE" | cut -d= -f2)
ORIGIN=$(grep "origin=" "$ASSET_FILE" | cut -d= -f2)
NOTES=$(grep "notes=" "$ASSET_FILE" | cut -d= -f2)

# Output result
echo "✅ Teardown complete for $ASSET_ID"
echo "🧠 Type: $TYPE"
echo "🔍 Salvage Grade: $GRADE"
echo "🌐 Origin: $ORIGIN
