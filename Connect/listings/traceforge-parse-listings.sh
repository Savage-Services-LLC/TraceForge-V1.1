#!/bin/bash
LISTINGS_DIR="$HOME/Traceforge-V1.1/Connect/listings"
echo "[TraceForge] Parsing listings from $LISTINGS_DIR"

for file in "$LISTINGS_DIR"/*; do
  case "$file" in
      *.yaml) echo "Validating YAML: $file"; yq eval "$file" > /dev/null ;;
          *.json) echo "Validating JSON: $file"; jq empty "$file" ;;
              *.md) echo "Overlay detected: $file"; grep -q "##" "$file" && echo "✓ Markdown OK" ;;
                  *.csv) echo "Parsing CSV: $file"; head -n 1 "$file" ;;
                      *.txt) echo "Reading logic map: $file"; head -n 5 "$file" ;;
                          *) echo "Unknown file type: $file" ;;
                            esac
                            done