#!/bin/bash
decoded=$(zbarimg --quiet --raw "$1")
echo "📥 Decoded QR: $decoded"
traceforge connect --session "$decoded"