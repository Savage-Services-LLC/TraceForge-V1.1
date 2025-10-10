#!/bin/bash
case "$1" in
  commit)
      bash ~/TraceForge/Connect/git/post-run-hook.sh "$2" "$3"
          ;;
            sync)
                bash ~/TraceForge/Connect/git/sync-configs.sh
                    ;;
                      push)
                          git push origin main
                              ;;
                                *)
                                    echo "Usage: traceforge-git.sh [commit|sync|push]"
                                        ;;
                                        esac