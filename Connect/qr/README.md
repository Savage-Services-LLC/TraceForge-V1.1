# 📲 TraceForge QR Connect

This directory scaffolds QR generation and decoding for CLI session linking, teardown verification, and packaging overlays.

## Modules

- `qr-generate.sh` — Creates QR from session metadata
- `qr-decode.sh` — Decodes QR and triggers CLI module
- `qr-template.txt` — Branded payload scaffold
- `qr-session.json` — Metadata for QR generation
- `qr-overlay.svg` — Optional branded visual layer

## Usage

```bash
bash qr-generate.sh "$(cat qr-template.txt)"
bash qr-decode.sh qr_20251009_103000.png