# 🛠️ TraceForge Teardown Logic

This directory contains branded teardown scaffolds, logs, and overlays for restoration-grade CLI operations.

## Modules

- `teardown-template.md` — Stepwise teardown guide
- `teardown-log-blank.txt` — Field-ready log template
- `teardown-session.sh` — Launches teardown session with banner
- `teardown-flags.json` — Tracks teardown progress
- `teardown-overlay.txt` — CLI banner for teardown ops

## Usage

```bash
bash teardown-session.sh
traceforge restore --log teardown_20251009.log