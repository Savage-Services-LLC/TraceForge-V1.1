#!/bin/bash

# ┌────────────────────────────────────────────┐
# │ TraceForge-V1.2 | Branded Boot Trigger     │
# └────────────────────────────────────────────┘

# Timestamp + asset ID
STAMP=$(date +"%Y%m%d_%H%M%S")
ASSET_ID="boot_$STAMP"

# Display banner
if [ -f ActiveModules/banner.txt ]; then
  cat ActiveModules/banner.txt
else
  echo "⚠️ No banner found. Proceeding without branding."
fi

# Log boot event
mkdir -p .audit
echo "[$STAMP] Boot triggered for asset: $ASSET_ID" >> .audit/boot.log

# List available modules
echo "🔍 Available modules in tracebundle:"
ls ActiveModules/tracebundle | grep .sh

# Prompt for module selection
read -p "Enter module name to execute (without .sh): " MODULE

# Validate and route
MODULE_PATH="ActiveModules/tracebundle/${MODULE}.sh"
if [ -f "$MODULE_PATH" ]; then
  echo "🚀 Executing $MODULE_PATH for asset $ASSET_ID..."
  bash "$MODULE_PATH" "$ASSET_ID"
  echo "✅ Module $MODULE completed for $ASSET_ID" >> .audit/boot.log
else
  echo "❌ Module not found: $MODULE_PATH"
  exit 1
fi
