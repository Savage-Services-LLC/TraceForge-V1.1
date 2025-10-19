#!/bin/bash

# 📁 Source of verified modules
source_dir="$HOME/TraceForge-V1.1/Restore"

# 📓 Sync log
sync_log="$HOME/TraceForge-V1.1/audit/connect_sync.log"
mkdir -p "$(dirname "$sync_log")"

# 🧠 Flags
dry_run=false
boardsort=false
ebay=false
local_inventory=false

# 🔍 Parse flags
for arg in "$@"; do
  case $arg in
      --dry-run) dry_run=true ;;
          --boardsort) boardsort=true ;;
              --ebay) ebay=true ;;
                  --local) local_inventory=true ;;
                      --source=*) source_dir="${arg#*=}" ;;
                        esac
                        done
                        
                        # 🎯 Banner trigger
                        traceforge banner --connect
                        
                        # 🔗 Sync logic
                        for file in "$source_dir"/*; do
                          [[ -f "$file" ]] || continue
                            filename=$(basename "$file")
                              log_entry="$(date '+%Y-%m-%d %H:%M:%S') Syncing $filename"
                              
                                if $dry_run; then
                                    echo "$log_entry [DRY RUN]" >> "$sync_log"
                                        echo "$log_entry [DRY RUN]" | traceforge manifest --append
                                            continue
                                              fi
                                              
                                                if $boardsort; then
                                                    echo "$log_entry → Boardsort bundle" >> "$sync_log"
                                                        echo "$log_entry → Boardsort bundle" | traceforge manifest --append
                                                            # Optional: cp "$file" "$HOME/TraceForge-V1.1/BoardsortStaging/"
                                                              fi
                                                              
                                                                if $ebay; then
                                                                    echo "$log_entry → eBay listing prep" >> "$sync_log"
                                                                        echo "$log_entry → eBay listing prep" | traceforge manifest --append
                                                                            # Optional: cp "$file" "$HOME/TraceForge-V1.1