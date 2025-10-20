#!/bin/bash

# ┌────────────────────────────────────────────┐
# │ TraceForge-V1.2 | Hardware Teardown Module │
# └────────────────────────────────────────────┘

ASSET_ID="$1"
STAMP=$(date +"%Y%m%d_%H%M%S")

# Display branded header
echo "⚙️ TraceForge-V1.2 | Hardware Teardown Engine"
echo "🔗 Asset ID: $ASSET_ID"

# Prompt for asset file
read -p "Enter path to hardware asset (e.g., assets/board001.txt): " ASSET_PATH

# Extract teardown notes
NOTES=$(grep "TeardownNotes:" "$ASSET_PATH" | cut -d':' -f2- | xargs)
GRADE=$(grep "SalvageGrade:" "$ASSET_PATH" | cut -d':' -f2 | xargs)
TYPE=$(grep "BoardType:" "$ASSET_PATH" | cut -d':' -f2 | xargs)

echo "🧠 Board Type: $TYPE"
echo "📊 Salvage Grade: $GRADE"
echo "📝 Teardown Notes: $NOTES"

# Inject branded overlay
OVERLAY_PATH="overlays/${ASSET_ID}_overlay.txt"
echo "⚙️ TraceForge Overlay for $ASSET_ID" > "$OVERLAY_PATH"
echo "BoardType: $TYPE" >> "$OVERLAY_PATH"
echo "SalvageGrade: $GRADE" >> "$OVERLAY_PATH"
echo "TeardownNotes: $NOTES" >> "$OVERLAY_PATH"
echo "Timestamp: $STAMP" >> "$OVERLAY_PATH"

# Log to audit
mkdir -p .audit
echo "[$STAMP] Hardware teardown completed for $ASSET_ID | Type: $TYPE | Grade: $GRADE" >> .audit/trace.log

# Optional: echo success
echo "✅ Overlay injected: $OVERLAY_PATH"
