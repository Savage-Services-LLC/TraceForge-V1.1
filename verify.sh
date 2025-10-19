#!/bin/bash
# TraceForge-V1.1 Verifier
# Validates overlays and generates verify_report.csv with flagged entries

OVERLAY_DIR="../overlays"
REPORT_DIR="./"
AUDIT_DIR="../audit"
mkdir -p "$AUDIT_DIR"

TIMESTAMP=$(date +%Y%m%d_%H%M%S)
REPORT_FILE="$REPORT_DIR/verify_report_$TIMESTAMP.csv"
LOG_FILE="$AUDIT_DIR/verify_$TIMESTAMP.log"

echo "[TraceForge] Starting verification..." | tee -a "$LOG_FILE"
echo "Overlay,Line,Issue,Item,Type,Brand,Condition" > "$REPORT_FILE"

for overlay in "$OVERLAY_DIR"/*.csv; do
  OVERLAY_NAME=$(basename "$overlay")
    echo "  → Verifying overlay: $OVERLAY_NAME" | tee -a "$LOG_FILE"
    
      lineno=0
        while IFS=',' read -r ITEM TYPE BRAND CONDITION; do
            lineno=$((lineno + 1))
                ISSUE=""
                    if [[ -z "$ITEM" || -z "$TYPE" || -z "$BRAND" || -z "$CONDITION" ]]; then
                          ISSUE="Incomplete entry"
                                echo "    [!] Line $lineno: $ISSUE → $ITEM,$TYPE,$BRAND,$CONDITION" | tee -a "$LOG_FILE"
                                      echo "$OVERLAY_NAME,$lineno,$ISSUE,$ITEM,$TYPE,$BRAND,$CONDITION" >> "$REPORT_FILE"
                                          fi
                                            done < "$overlay"
                                            done
                                            
                                            echo "[TraceForge] Verification complete. Report saved to: $REPORT_FILE" | tee -a "$LOG_FILE"\