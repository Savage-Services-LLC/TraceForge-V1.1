#!/bin/bash
# TraceForge-V1.1 Sync Script
# Pulls from origin, merges into local branch, revalidates overlays, and logs the sync operation

AUDIT_DIR="./audit"
VERIFY_DIR="./Verify"
mkdir -p "$AUDIT_DIR"

TIMESTAMP=$(date +%Y%m%d_%H%M%S)
LOG_FILE="$AUDIT_DIR/sync_$TIMESTAMP.log"

echo "[TraceForge] Starting upstream sync..." | tee -a "$LOG_FILE"

# Get current branch
BRANCH=$(git rev-parse --abbrev-ref HEAD)
echo "  → Current branch: $BRANCH" | tee -a "$LOG_FILE"

# Pull from origin
echo "  → Pulling from origin/$BRANCH..." | tee -a "$LOG_FILE"
git pull origin "$BRANCH" | tee -a "$LOG_FILE"

# Optional: auto-merge handling
if [[ $? -ne 0 ]]; then
  echo "  [!] Merge conflict or pull failed. Resolve manually." | tee -a "$LOG_FILE"
  exit 1
fi

# Revalidate overlays
if [[ -x "$VERIFY_DIR/verify.sh" ]]; then
  echo "  → Revalidating overlays..." | tee -a "$LOG_FILE"
  "$VERIFY_DIR/verify.sh" | tee -a "$LOG_FILE"
else
  echo "  [!] verify.sh not found or not executable." | tee -a "$LOG_FILE"
fi

echo "[TraceForge] Sync complete. Logged to: $LOG_FILE"
