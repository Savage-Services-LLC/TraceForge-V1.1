#!/bin/bash

# TRACEFORGE: Diagnostic Test Runner
# Usage: ./testing.sh board1.jpg

BOARD_IMG="$1"
READINGS="./TF_INITIATE/readings.csv"
SESSION="./TF_INITIATE/session.yaml"
OUTPUT_DIR="./TF_INITIATE/logs"

mkdir -p "$OUTPUT_DIR"

echo "[TRACEFORGE] Running diagnostics for $BOARD_IMG..."

# Step 1: Run continuity and fuse tests
python3 ./modules/test_fuses.py \
  --board "$BOARD_IMG" \
  --readings "$READINGS" \
  --output "$OUTPUT_DIR/fuse_test_$(basename "$BOARD_IMG" .jpg).txt"

# Step 2: Run coil resistance and diode drop checks
python3 ./modules/test_passives.py \
  --board "$BOARD_IMG" \
  --readings "$READINGS" \
  --output "$OUTPUT_DIR/verify_$(basename "$BOARD_IMG" .jpg).log"

echo "[TRACEFORGE] Diagnostics complete. Logs saved to $OUTPUT_DIR"