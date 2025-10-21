#!/bin/bash

COMMAND=$1
ASSET_ID=$2

# Branded CLI banner
echo "🛠️ TraceForge-V1.2 CLI Router"
cat banner.txt

# Run environment check
./env_check.sh

# Route commands
case "$COMMAND" in
  teardown)
    ./ActiveModules/hardware_teardown.sh "$ASSET_ID"
    ;;
  overlay)
    ./ActiveModules/overlay.sh "$ASSET_ID"
    ;;
  manifest)
    ./ActiveModules/manifest.sh "$ASSET_ID"
    ;;
  *)
    echo "[TraceForge] Unknown command: $COMMAND"
    echo "Usage: ./traceforge.sh [teardown|overlay|manifest] [asset_id]"
    ;;
esac
