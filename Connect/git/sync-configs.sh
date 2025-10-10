#!/bin/bash
cp -r ~/TraceForge/Config/mc/* ~/TraceForge/Repo/config/mc/
cp -r ~/TraceForge/Config/termux-properties/* ~/TraceForge/Repo/config/termux/
cp -r ~/TraceForge/Config/tampermonkey/* ~/TraceForge/Repo/config/tampermonkey/
git add .
git commit -m "🔄 Synced config bundles — $(date -u +"%Y-%m-%dT%H:%M:%SZ")"