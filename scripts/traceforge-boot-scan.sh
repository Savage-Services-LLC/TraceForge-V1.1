#!/bin/bash

# 🔒 Optional: keep device awake during scan
termux-wake-lock

# 📁 Source directory of dangling files
source_dir="$HOME/Downloads"

# 📓 Audit log
audit_log="$HOME/TraceForge-V1.1/audit/tracefile_sort.log"
mkdir -p "$(dirname "$audit_log")"

# 🔍 Keyword-to-directory map
declare -A keyword_map=(
  ["invoice"]="$HOME/Documents/Invoices"
    ["photo"]="$HOME/Pictures"
      ["report"]="$HOME/Documents/Reports"
        ["trace"]="$HOME/TraceForge-V1.1/Logs"
        )
        
        # 🎯 Banner trigger
        traceforge banner --boot
        
        # 🧪 Scan and sort
        for file in "$source_dir"/*; do
          [[ -f "$file" ]] || continue
            matched=false
            
              for keyword in "${!keyword_map[@]}"; do
                  if grep -qi "$keyword" "$file"; then
                        target_dir="${keyword_map[$keyword]}"
                              mkdir -p "$target_dir"
                                    mv "$file" "$target_dir/"
                                          log_entry="$(date '+%Y-%m-%d %H:%M:%S') Moved $(basename "$file") to $target_dir (matched: $keyword)"
                                                echo "$log_entry" >> "$audit_log"
                                                      echo "$log_entry" | traceforge manifest --append
                                                            matched=true
                                                                  break
                                                                      fi
                                                                        done
                                                                        
                                                                          if [ "$matched" = false ]; then
                                                                              log_entry="$(date '+%Y-%m-%d %H:%M:%S') No match for $(basename "$file")"
                                                                                  echo "$log_entry" >> "$audit_log"
                                                                                      echo "$log_entry" | traceforge manifest --append
                                                                                        fi
                                                                                        done
                                                                                        
                                                                                        # 🔓 Release wake lock
                                                                                        termux-wake-unlock