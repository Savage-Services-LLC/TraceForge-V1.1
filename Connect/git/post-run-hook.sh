#!/bin/bash
module="$1"
session_id="$2"
timestamp=$(date -u +"%Y-%m-%dT%H:%M:%SZ")
hash=$(git rev-parse HEAD)

msg=$(sed "s/{module}/$module/" ~/TraceForge/Connect/git/commit-template.txt |
      sed "s/{session_id}/$session_id/" |
            sed "s/{timestamp}/$timestamp/" |
                  sed "s/{hash}/$hash/")
                  
                  git add .
                  git commit -m "$msg"