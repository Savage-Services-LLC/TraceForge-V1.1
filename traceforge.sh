#!/bin/bash

source env_check.sh

echo "🛠️ TraceForge-V1.2 CLI Router"
cat banner.txt

COMMAND=$1
ASSET=$2

# Log command routing
echo "[$(date)] ROUTE: $COMMAND $ASSET" >> .audit/trace.log

case "$COMMAND" in
  teardown)
    bash ActiveModules/hardware_teardown.sh "$ASSET"
    ;;
  overlay)
    bash ActiveModules/overlay.sh "$ASSET"
    ;;
  manifest)
    bash ActiveModules/manifest.sh
    ;;
  *)
    echo "❌ Unknown command: $COMMAND"
    echo "Usage: ./traceforge.sh [teardown|overlay|manifest] [asset_id]"
    ;;
esac
