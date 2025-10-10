#!/bin/bash
clear
cat ~/Traceforge-V1.1/Connect/teardown/teardown-overlay.txt
echo "Starting teardown session..."
touch teardown_$(date -u +"%Y%m%d_%H%M%S").log