#!/bin/bash

# 🔍 Keyword-to-directory map
declare -A keyword_map=(
  ["invoice"]="$HOME/Documents/Invoices"
    ["photo"]="$HOME/Pictures"
      ["report"]="$HOME/Documents/Reports"
        ["trace"]="$HOME/TraceForge/Logs"
        )
        
        # 📁 Source directory
        source_dir="$HOME/Downloads"
        
        # 📓 Audit log file
        audit_log="$HOME/TraceForge/audit/tracefile_sort.log"
        mkdir -p "$(dirname "$audit_log")"
        
        # 🧠 Flags
        dry_run=false
        boot_trigger=false
        
        # 🧩 Parse flags
        for arg in "$@"; do
          case $arg in
              --dry-run) dry_run=true ;;
                  --boot) boot_trigger=true ;;
                    esac
                    done
                    
                    # 🎯 Banner trigger
                    if $boot_trigger; then
                      traceforge banner --boot
                        echo "$(date '+%Y-%m-%d %H:%M:%S') Boot scan triggered" | traceforge manifest --append
                        fi
                        
                        # 🧪 Scan and sort
                        for file in "$source_dir"/*; do
                          [[ -f "$file" ]] || continue
                            matched=false
                            
                              for keyword in "${!keyword_map[@]}"; do
                                  if grep -qi "$keyword" "$file"; then
                                        target_dir="${keyword_map[$keyword]}"
                                              mkdir -p "$target_dir"
                                                    log_entry="$(date '+%Y-%m-%d %H:%M:%S') Matched '$keyword' in $(basename "$file") → $target_dir"
                                                    
                                                          if $dry_run; then
                                                                  echo "$log_entry [DRY RUN]" >> "$audit_log"
                                                                        else
                                                                                mv "$file" "$target_dir/"
                                                                                        echo "$log_entry" >> "$audit_log"
                                                                                              fi
                                                                                              
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