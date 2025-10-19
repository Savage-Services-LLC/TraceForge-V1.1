#!/bin/bash
cd ~/Traceforge-V1.1
git add connect/*
git commit -m "Sync: teardown-kit-drop7 [graded: high-peripheral] [timestamp: $(date -Iseconds)]"
git push origin main
echo "$(date -Iseconds) — Synced teardown-kit-drop7 to GitHub" >> connect/sync-log.txt//