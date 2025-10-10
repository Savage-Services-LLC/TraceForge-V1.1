#!/bin/bash
timestamp=$(date -u +"%Y-%m-%dT%H:%M:%SZ")
echo "Remote session started at $timestamp on traceforge-node" >> ~/Traceforge/Logs/ssh-audit.log