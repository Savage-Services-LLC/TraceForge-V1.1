#!/data/data/com.termux/files/usr/bin/bash

# TRACEFORGE: Restoration Overlay Builder
# Savage Services LLC – Anchorage, AK
# Usage: ./restore.sh board1.jpg

BOARD_IMG="$1"
SESSION="./TF_INITIATE/session.yaml"
READINGS="./TF_INITIATE/readings.csv"
OVERLAY_BASE="./TF_INITIATE/restore_overlay_base.png"
OUTPUT_DIR="./TF_INITIATE/overlays"
mkdir -p "$OUTPUT_DIR"

echo "──────────────────────────────────────────────"
echo "TRACEFORGE RESTORE – Generating overlay for $BOARD_IMG"
echo "Session: $(grep session_id $SESSION | awk '{print $2}')"
echo "──────────────────────────────────────────────"

# STEP 1: Parse readings and flag restoration zones
python3 ./modules/gen_restore_overlay.py \
  --board "$BOARD_IMG" \
    --readings "$READINGS" \
      --session "$SESSION" \
        --overlay "$OVERLAY_BASE" \
          --output "$OUTPUT_DIR/$(basename "$BOARD_IMG" .jpg)_restore_overlay.png"
          
          echo "[TF_RESTORE] Overlay saved to $OUTPUT_DIR"
