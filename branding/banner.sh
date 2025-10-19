#!/bin/bash
# 📓 TraceForge-V1.1 | banner.sh
# 🔧 Displays branded CLI banners based on mode

MODE=$1

case "$MODE" in
  --mode=verify)
      cat branding/banner_verify.txt
          ;;
            --mode=teardown)
                cat branding/banner_teardown.txt
                    ;;
                      --mode=bundle)
                          cat branding/banner_bundle.txt
                              ;;
                                --mode=deploy)
                                    cat branding/banner_deploy.txt
                                        ;;
                                          *)
                                              cat branding/banner_default.txt
                                                  ;;
                                                  esac
                                                  
                                                  # Optional: append timestamp
                                                  echo "🔐 Session started: $(date '+%Y-%m-%d %H:%M:%S')"