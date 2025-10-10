#!/bin/bash
input="$1"
output="qr_$(date -u +"%Y%m%d_%H%M%S").png"
echo "$input" | qrencode -o "$output"
echo "✅ QR generated: $output"