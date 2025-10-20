#!/bin/bash
# TraceForge-V1.1 Flagging Script
# Routes incomplete or flagged entries from verify_report.csv into quarantine.csv for audit isolation

REPORT_DIR="./"
QUARANTINE_DIR="../overlays"
QUARANTINE_FILE="$QUARANTINE_DIR/quarantine.csv"

# Find latest verify report
LATEST_REPORT=$(ls -t "$REPORT_DIR"/verify_report_*.csv 2>/dev/null | head -n 1)

if [[ ! -f "$LATEST_REPORT" ]]; then
  echo "[TraceForge] No verify_report.csv found. Run verify.sh first."
  exit 1
fi

echo "[TraceForge] Flagging entries from: $(basename "$LATEST_REPORT")"
echo "Item,Type,Brand,Condition,SourceOverlay" > "$QUARANTINE_FILE"

tail -n +2 "$LATEST_REPORT" | while IFS=',' read -r OVERLAY LINE ISSUE ITEM TYPE BRAND CONDITION; do
  echo "$ITEM,$TYPE,$BRAND,$CONDITION,$OVERLAY" >> "$QUARANTINE_FILE"
  echo "  → Quarantined: $ITEM ($TYPE, $BRAND, $CONDITION) from $OVERLAY"
done

echo "[TraceForge] Quarantine complete. Output saved to: $QUARANTINE_FILE
