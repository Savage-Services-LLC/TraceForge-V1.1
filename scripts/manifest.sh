#!/data/data/com.termux/files/usr/bin/bash

# 📓 TraceForge-V1.1 Manifest Logger
manifest_file="$HOME/TraceForge-V1.1/audit/Manifest.log"
mkdir -p "$(dirname "$manifest_file")"

# 🧠 Flags
dry_run=false
overlay=false
entry=""

# 🔍 Parse flags and input
for arg in "$@"; do
  case $arg in
    --dry-run) dry_run=true ;;
    --overlay) overlay=true ;;
    --append) shift; entry="$*" ;;
    *) entry="$entry $arg" ;;
  esac
done

# 🕒 Timestamp
timestamp="$(date '+%Y-%m-%d %H:%M:%S')"

# 🧩 Final log line
log_line="$timestamp | $entry"

# 🧠 Dry run preview
if $dry_run; then
  echo "[DRY RUN] $log_line"
  exit 0
fi

# 📓 Append to Manifest
echo "$log_line" >> "$manifest_file"
echo "✅ Manifest updated: $log_line"

# 🎨 Optional overlay trigger
if $overlay; then
  bash ~/TraceForge-V1.1/scripts/overlay.sh --mode=manifest --entry="$log_line"
fi
