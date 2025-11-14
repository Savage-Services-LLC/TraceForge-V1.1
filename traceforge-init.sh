#!/bin/bash
# traceforge-init.sh — Branded Git initializer for TraceForge-V1.2

LOG_PATH="$HOME/TraceForge/logs/init.log"
REPO_PATH="$HOME/TF-V1.2"
REMOTE_URL="https://github.com/Savage-Services-LLC/TraceForge-V1.2.git"
GH_CLI_PATH="/data/data/com.termux/files/usr/bin/gh"

echo "[INIT] Starting TraceForge-V1.2 repo setup at $(date)" >> "$LOG_PATH"

# Step 1: Create repo directory if missing
mkdir -p "$REPO_PATH"
cd "$REPO_PATH" || exit

# Step 2: Initialize Git
git init >> "$LOG_PATH" 2>&1
echo "[✓] Git repo initialized in $REPO_PATH" >> "$LOG_PATH"

# Step 3: Inject remote
git remote add origin "$REMOTE_URL" >> "$LOG_PATH" 2>&1
echo "[✓] Remote set to $REMOTE_URL" >> "$LOG_PATH"

# Step 4: Inject global Git config
git config --global user.name "SavageOps"
git config --global user.email "savage@example.com"
git config --global credential."https://github.com".helper "!$GH_CLI_PATH auth git-credential"
git config --global credential."https://gist.github.com".helper "!$GH_CLI_PATH auth git-credential"
echo "[✓] Global Git config injected" >> "$LOG_PATH"

# Step 5: Touch README and commit
echo "# TraceForge-V1.2" > README.md
git add README.md
git commit -m "Initial commit from traceforge-init.sh" >> "$LOG_PATH" 2>&1
echo "[✓] Initial commit created" >> "$LOG_PATH"

# Step 6: Push to GitHub
git push -u origin master >> "$LOG_PATH" 2>&1
echo "[✓] Repo pushed to GitHub" >> "$LOG_PATH"

echo "[DONE] TraceForge-V1.2 setup complete at $(date)" >> "$LOG_PATH"
