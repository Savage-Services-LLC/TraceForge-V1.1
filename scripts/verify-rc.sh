#!/bin/bash

# 📁 Source directory for RC components
source_dir="$HOME/TraceForge-V1.1/Restore"

# 📓 Audit log
audit_log="$HOME/TraceForge-V1.1/audit/verify_rc.log"
mkdir -p "$(dirname "$audit_log")"

# 🧠 Flags
dry_run=false
overlay=false

# 🔍 Parse flags
for arg in "$@"; do
  case $arg in
      --dry-run) dry_run=true ;;
          --overlay) overlay=true ;;
              --source=*) source_dir="${arg#*=}" ;;
                esac
                done
                
                # 🎯 Banner trigger
                bash ~/TraceForge-V1.1/scripts/banner.sh --verify-rc
                
                # 🔍 Verification logic
                for file in "$source_dir"/*; do
                  [[ -f "$file" ]] || continue
                    filename=$(basename "$file")
                      log_entry=""
                      
                        # 🔋 Battery check
                          if [[ "$filename" == *"Venom"* && "$filename" == *"3200"* ]]; then
                              log_entry="$(date '+%Y-%m-%d %H:%M:%S') Verified Venom 3200mAh 14.8V LiPo battery"
                                fi
                                
                                  # 📡 Receiver check
                                    if [[ "$filename" == *"Spektrum"* && "$filename" == *"AR6335A"* ]]; then
                                        log_entry="$(date '+%Y-%m-%d %H:%M:%S') Verified Spektrum AR6335A receiver with AS3X"
                                          fi
                                          
                                            # 🧩 Log and manifest
                                              if $dry_run; then
                                                  echo "$log_entry [DRY RUN]" >> "$audit_log"
                                                      echo "$log_entry [DRY RUN]" | bash ~/TraceForge-V1.1/scripts/manifest.sh --append
                                                        else
                                                            echo "$log_entry" >> "$audit_log"
                                                                echo "$log_entry" | bash ~/TraceForge-V1.1/scripts/manifest.sh --append
                                                                  fi
                                                                  
                                                                    # 🎨 Optional overlay
                                                                      if $overlay; then
                                                                          bash ~/TraceForge-V1.1/scripts/overlay.sh --file="$file" --mode=verify-rc
                                                                            fi
                                                                            done