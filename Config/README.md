# ⚙️ TraceForge Termux Properties

This directory contains branded configuration files for customizing Termux behavior and integrating TraceForge CLI modules.

## Setup

1. Copy `termux.properties` to `~/.termux/`
2. Run `termux-reload-settings`
3. Add `traceforge-launch.sh` to `.bashrc` or run manually
4. Customize `motd.txt` for session branding

## Modules

- `TRACE`, `IDENTIFY`, `RESTORE`, `MANIFEST`, `AUDIT`, `CONNECT` — mapped to extra keys
- Session banner displayed on launch
- CLI bridge initialized via `traceforge