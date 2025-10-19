#!/bin/bash

# 📁 Target directory to verify
target_dir="$HOME/TraceForge/Restore"

# 📓 Audit log
audit_log="$HOME/TraceForge/audit/verify.log"
mkdir -p "$(dirname "$audit_log")"

# 🧠 Flags
dry_run=false
hash_check=false

# 🔍 Parse flags
for arg in "$@"; do
  case $arg in
      --dry-run) dry_run=true ;;
          --hash) hash_check=true ;;
              --source=*) target_dir="${arg#*=}" ;;
                esac
                done
                
                # 🎯 Banner trigger
                traceforge banner --verify
                
                # 🧪 Scan and verify
                for file in "$target_dir"/*; do
                  [[ -f "$file" ]] || continue
                    filename=$(basename "$file")
                      log_entry=""
                      
                        if $hash_check; then
                            # Example: SHA256 hash check
                                hash=$(sha256sum "$file" | awk '{print $1}')
                                    log_entry="$(date '+%Y-%m-%d %H:%M:%S') Verified $filename with SHA256: $hash"
                                      else
                                          # Content-based keyword check
                                              if grep -qi "verified" "$file"; then
                                                    log_entry="$(date '+%Y-%m-%d %H:%M:%S') Verified content match in $filename"
                                                        else
                                                              log_entry="$(date '+%Y-%m-%d %H:%M:%S') No verification match in $filename"
                                                                  fi
                                                                    fi
                                                                    
                                                                      # 🧩 Log and pipe
                                                                        if $dry_run; then
                                                                            echo "$log_entry [DRY RUN]" >> "$audit_log"
                                                                              else
                                                                                  echo "$log_entry" >> "$audit_log"
                                                                                    fi
                                                                                    
                                                                                      echo "$log_entry" | traceforge manifest --append
                                                                                      done