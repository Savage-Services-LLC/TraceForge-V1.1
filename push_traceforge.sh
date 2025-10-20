#!/bin/bash

# ┌────────────────────────────────────────────┐
# │ TraceForge-V1.1 | Branded Git Push Routine │
# └────────────────────────────────────────────┘

# Set Git identity
git config --global user.name "MidnightRaven907"
git config --global user.email "MidnightRaven907@users.noreply.github.com"

# Rename branch to main
git branch -M main

# Add remote if missing
git remote remove origin 2>/dev/null
git remote add origin https://github.com/Savage-Services-LLC/TraceForge-V1.1.git

# Stage all changes
git add .

# Timestamp + asset ID for audit
STAMP=$(date +"%Y%m%d_%H%M%S")
ASSET_ID="traceforge_push_$STAMP"

# Commit with branded message
git commit -m "TraceForge-V1.1 sync [$ASSET_ID]"

# Push with force (safe if you're sole maintainer)
git push -u origin main --force

# Log to .audit/
mkdir -p .audit
echo "[$STAMP] Push completed for asset: $ASSET_ID" >> .audit/git_sync.log

# Optional: echo success
echo "✅ TraceForge-V1.1 pushed and logged as $ASSET_ID"
