#!/bin/bash

echo "🔍 TraceForge-V1.2 Environment Check"

# Check for required secret (passed as env var)
if [ -z "$TRACEFORGE_SECRET" ]; then
  echo "❌ Missing TRACEFORGE_SECRET. Aborting."
  exit 1
else
  echo "✅ TRACEFORGE_SECRET detected."
fi

# Check for required variables
if [ -z "$TRACEFORGE_ENV" ]; then
  echo "❌ TRACEFORGE_ENV not set. Aborting."
  exit 1
else
  echo "✅ TRACEFORGE_ENV=$TRACEFORGE_ENV"
fi

if [ -z "$OVERLAY_FORMAT" ]; then
  echo "❌ OVERLAY_FORMAT not set. Aborting."
  exit 1
else
  echo "✅ OVERLAY_FORMAT=$OVERLAY_FORMAT"
fi

# Check for audit folder
if [ ! -d ".audit" ]; then
  echo "❌ .audit folder missing. Creating..."
  mkdir .audit
  echo "✅ .audit folder created."
else
  echo "✅ .audit folder present."
fi

# Log environment context
echo "[$(date)] ENV CHECK: ENV=$TRACEFORGE_ENV FORMAT=$OVERLAY_FORMAT" >> .audit/env_trace.log

echo "✅ Environment check complete. Ready for teardown or overlay execution."
