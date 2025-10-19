#!/bin/bash
# TraceForge-V1.1 Manifest Generator
# Bundles teardown logs, overlays, and resale metadata into a branded manifest

MANIFEST_DIR="./manifests"
AUDIT_DIR="./audit"
OVERLAY_DIR="./overlays"
mkdir -p "$MANIFEST_DIR" "$AUDIT_DIR"

TIMESTAMP=$(date +%Y%m%d_%H%M%S)
MANIFEST_FILE="$MANIFEST_DIR/manifest_$TIMESTAMP.csv"
LOG_FILE="$AUDIT_DIR/manifest_$TIMESTAMP.log"

echo "[TraceForge] Generating manifest: $MANIFEST_FILE" | tee -a "$LOG_FILE"

# Header
echo "Item,Type,Brand,Condition,Overlay" > "$MANIFEST_FILE"

# Aggregate overlays
for overlay in "$OVERLAY_DIR"/*.csv; do
  OVERLAY_NAME=$(basename "$overlay" .csv)
    echo "[TraceForge] Routing overlay: $OVERLAY_NAME" | tee -a "$LOG_FILE"
    
      while IFS=',' read -r ITEM TYPE BRAND CONDITION; do
          echo "$ITEM,$TYPE,$BRAND,$CONDITION,$OVERLAY_NAME" >> "$MANIFEST_FILE"
              echo "  → $ITEM ($TYPE, $BRAND, $CONDITION)" | tee -a "$LOG_FILE"
                done < "$overlay"
                done
                
                echo "[TraceForge] Manifest complete: $MANIFEST_FILE" | tee -a "$LOG_FILE"