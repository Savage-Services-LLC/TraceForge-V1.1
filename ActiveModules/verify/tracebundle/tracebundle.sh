#!/bin/bash
# tracebundle.sh — Modular Recon Script
source ../../overlays/traceforge_colors.sh

target="$2"
timestamp=$(date +"%Y-%m-%d_%H-%M-%S")
logfile="logs/tracebundle_${target}_${timestamp}.log"
summary="logs/summary_${target}_${timestamp}.txt"

echo -e "${CYAN}🔍 TRACEFORGE VERIFY — $target${NC}"
echo -e "Generated: $timestamp\n"

if [[ "$1" == "--brief" ]]; then
  whois "$target" | grep -Ei 'Registrar|Creation|Expiry|Name Server' > "$summary"
    dnsenum "$target" | grep -Ei 'Host|NS|MX|TXT' >> "$summary"
      nmap -Pn -T4 "$target" | grep -Ei 'open|filtered|closed' >> "$summary"
        sqlmap -u "http://$target" --batch --crawl=1 | grep -Ei 'parameter|injection|vulnerable' >> "$summary"
          cat "$summary"
          elif [[ "$1" == "--full" ]]; then
            echo -e "\n🧾 WHOIS:" | tee "$logfile"
              whois "$target" | tee -a "$logfile"
                echo -e "\n🌐 DNSENUM:" | tee -a "$logfile"
                  dnsenum "$target" | tee -a "$logfile"
                    echo -e "\n📡 NMAP:" | tee -a "$logfile"
                      nmap -Pn -T4 "$target" | tee -a "$logfile"
                        echo -e "\n🧪 SQLMAP:" | tee -a "$logfile"
                          sqlmap -u "http://$target" --batch --crawl=1 | tee -a "$logfile"
                          elif [[ "$1" == "--manifest" ]]; then
                            bash "$0" --brief "$target"
                              bash "$0" --full "$target"
                              else
                                echo -e "${YELLOW}Usage: traceforge verify --brief|--full|--manifest --target example.com${NC}"
                                fi