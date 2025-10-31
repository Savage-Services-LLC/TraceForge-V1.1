# boot/traceforge-boot.sh
#!/data/data/com.termux/files/usr/bin/bash
for script in $HOME/TraceForge-V1.3/boot/*.sh; do
  bash "$script"
done
