#!/bin/bash
# traceforge-version-check.sh — Classifies TraceForge directories by version expectations

SCAN_ROOT="$HOME"
LOG_PATH="$HOME/TraceForge/logs/version-check.log"
mkdir -p "$(dirname "$LOG_PATH")"

echo "[CHECK] Starting version classification at $(date)" >> "$LOG_PATH"

find "$SCAN_ROOT" -maxdepth 1 -type d -name "TF-*" | while read -r DIR; do
    VERSION="unknown"
    echo "[SCAN] Inspecting $DIR" >> "$LOG_PATH"

    # Check for V1.3 indicators
    if [[ -f "$DIR/traceforge-sync.sh" || -f "$DIR/traceforge-push.sh" ]]; then
        VERSION="V1.3"
    # Check for V1.2 indicators
    elif [[ -f "$DIR/traceforge-ui.js" || -f "$DIR/traceforge-auth.sh" ]]; then
        VERSION="V1.2"
    # Check for V1.1 indicators
    elif [[ -f "$DIR/traceforge.sh" && ! -f "$DIR/traceforge-ui.js" ]]; then
        VERSION="V1.1"
    fi

    # Check Git remote if unclear
    if [[ "$VERSION" == "unknown" && -f "$DIR/.git/config" ]]; then
        if grep -q "TraceForge-V1.3" "$DIR/.git/config"; then
            VERSION="V1.3"
        elif grep -q "TraceForge-V1.2" "$DIR/.git/config"; then
            VERSION="V1.2"
        fi
    fi

    echo "[RESULT] $DIR → $VERSION" >> "$LOG_PATH"
done

echo "[DONE] Version classification complete at $(date)" >> "$LOG_PATH"
