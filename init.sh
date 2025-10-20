#!/bin/bash

# ┌────────────────────────────────────────────┐
# │ TraceForge-V1.2 | Branded Boot Trigger     │
# └────────────────────────────────────────────┘

# Timestamp + asset ID
STAMP=$(date +"%Y%m%d_%H%M%S")
ASSET_ID="boot_$STAMP"

# Log boot event
mkdir -p .audit
echo "[$STAMP] Boot triggered for asset: $ASSET_ID" >> .audit/boot.log

# Detect asset type
echo "🔍 Select asset type:"
echo "1) Hardware"
echo "2) Jewelry"
read -p "Enter choice [1-2]: " TYPE

# Route based on selection
case $TYPE in
  1)
    echo "⚙️ Routing to hardware teardown..."
    ./modules/hardware_teardown.sh "$ASSET_ID"
    ;;
  2)
    echo "💍 Routing to jewelry appraisal..."
    ./modules/jewelry_overlay.sh "$ASSET_ID"
    ;;
  *)
    echo "❌ Invalid selection. Boot aborted."
    exit 1
    ;;
esac

# Optional: echo success
echo "✅ TraceForge-V1.2 boot completed for $ASSET_ID"
