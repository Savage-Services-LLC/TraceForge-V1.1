#!/data/data/com.termux/files/usr/bin/bash

# TRACEFORGE MASTER WRAPPER – Savage Services LLC
# Usage: ./traceforge.sh board1.jpg

BOARD_IMG="$1"
SESSION="./TF_INITIATE/session.yaml"
READINGS="./TF_INITIATE/readings.csv"
CONNECTORS="./TF_INITIATE/connectors.txt"
OVERLAY="./TF_INITIATE/restore_overlay_base.png"
OUTPUT_DIR="./TF_INITIATE/logs"
SCHEMATICS_DIR="./TF_INITIATE/schematics"
mkdir -p "$OUTPUT_DIR" "$SCHEMATICS_DIR"

echo "──────────────────────────────────────────────"
echo "TRACEFORGE MASTER RUN – $BOARD_IMG"
echo "Session: $(grep session_id $SESSION | awk '{print $2}')"
echo "──────────────────────────────────────────────"

# STEP 1: IDENTIFY
echo "[TF_IDENTIFY] Mapping components..."
bash ./scripts/identify.sh "$BOARD_IMG"

# STEP 2: VERIFY
echo "[TF_VERIFY] Running diagnostics..."
bash ./scripts/testing.sh "$BOARD_IMG"

# STEP 3: RESTORE
echo "[TF_RESTORE] Scaffolding restoration overlay..."
bash ./scripts/restore.sh "$BOARD_IMG"

# STEP 4: CONNECT
echo "[TF_CONNECT] Generating pinout and schematic maps..."
bash ./scripts/schematics.sh "$BOARD_IMG"

# STEP 5: MANIFEST
echo "[TF_MANIFEST] Building resale manifest..."
bash ./scripts/manifest.sh "$BOARD_IMG"

echo "──────────────────────────────────────────────"
echo "TRACEFORGE COMPLETE – Logs and overlays ready"
echo "──────────────────────────────────────────────"