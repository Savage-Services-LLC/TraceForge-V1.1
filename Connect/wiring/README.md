# 🧠 TraceForge Wiring Logic

This directory contains branded wiring overlays, fuse maps, and teardown paths for restoration-grade CLI operations.

## Modules

- `fuse-map.json` — Logical mapping of fuse ratings and positions
- `wiring-diagram.svg` — Schematic or ASCII wiring layout
- `teardown-paths.md` — Stepwise teardown logic
- `safety-notes.txt` — Electrical safety overlays
- `session-log-template.txt` — CLI session header for wiring ops

## Usage

```bash
traceforge restore --map wiring-diagram.svg
traceforge identify --fuse-map fuse-map.json