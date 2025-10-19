#!/bin/bash
# TraceForge-V1.1 Git Push Wrapper
# Verifies remote, pushes current branch, and logs the operation with branded traceability

AUDIT_DIR="./audit"
mkdir -p "$AUDIT_DIR"

TIMESTAMP=$(date +%Y%m%d_%H%M%S)
LOG_FILE="$AUDIT_DIR/push_$TIMESTAMP.log"

echo "[TraceForge] Starting push..." | tee -a "$LOG_FILE"

# Verify remote
REMOTE_URL=$(git remote get-url origin 2>/dev/null)
if [[ -z "$REMOTE_URL" ]]; then
  echo "[!] No remote 'origin' found. Set it with: git remote add origin <URL>" | tee -a "$LOG_FILE"
  exit 1
fi

echo "  → Remote verified: $REMOTE_URL" | tee -a "$LOG_FILE"

# Get current branch
BRANCH=$(git rev-parse --abbrev-ref HEAD)
echo "  → Current branch: $BRANCH" | tee -a "$LOG_FILE"

# Commit if needed
if [[ -n $(git status --porcelain) ]]; then
  echo "  → Staging and committing changes..." | tee -a "$LOG_FILE"
  git add .
  git commit -m "TraceForge-V1.1 push: $TIMESTAMP" | tee -a "$LOG_FILE"
else
  echo "  → No changes to commit." | tee -a "$LOG_FILE"
fi

# Push
echo "  → Pushing to origin/$BRANCH..." | tee -a "$LOG_FILE"
git push -u origin "$BRANCH" | tee -a "$LOG_FILE"

echo "[TraceForge] Push complete. Logged to: $LOG_FILE"
