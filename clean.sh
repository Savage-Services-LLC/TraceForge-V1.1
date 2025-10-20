#!/bin/bash
# TraceForge-V1.1 Cleanup Script
# Purges audit logs, overlays, manifests, and shell artifacts

echo "[TraceForge] Starting cleanup..."

# Directories
AUDIT_DIR="./audit"
OVERLAY_DIR="./overlays"
MANIFEST_DIR="./manifests"

# File patterns
LOG_PATTERN="*.log"
CSV_PATTERN="*.csv"
TMP_PATTERN="*.tmp"
BAK_PATTERN="*.bak"
SWP_PATTERN="*.swp"

# Purge audit logs
if [ -d "$AUDIT_DIR" ]; then
  echo "  → Clearing audit logs..."
  rm -f "$AUDIT_DIR"/$LOG_PATTERN
fi

# Purge overlays
if [ -d "$OVERLAY_DIR" ]; then
  echo "  → Clearing overlays..."
  rm -f "$OVERLAY_DIR"/$CSV_PATTERN
fi

# Purge manifests
if [ -d "$MANIFEST_DIR" ]; then
  echo "  → Clearing manifests..."
  rm -f "$MANIFEST_DIR"/$CSV_PATTERN
fi

# Purge shell artifacts
echo "  → Removing shell temp files..."
rm -f $TMP_PATTERN $BAK_PATTERN $SWP_PATTERN

echo "[TraceForge] Cleanup complete."
