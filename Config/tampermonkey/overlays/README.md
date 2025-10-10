# 🧩 TraceForge Tampermonkey Overlays

This directory contains branded visual overlays for browser-triggered TraceForge operations. These overlays are injected into the DOM by Tampermonkey scripts to confirm CLI handshakes, display session metadata, and reinforce forensic-grade traceability.

## 🎯 Purpose

- Confirm successful bridge events (e.g., teardown scaffolded, manifest generated)
- Display branded session headers and CLI banners
- Inject trust signals and restoration overlays into browser workflows
- Enhance user confidence during web-to-CLI automation

## 📁 Contents

- `teardown-confirm.html` — Confirms restore scaffold with session ID and timestamp
- `manifest-preview.html` — Displays generated manifest for Boardsort or eBay
- `session-header.html` — Injects branded CLI session banner
- `audit-log.html` — Shows recent browser-side triggers and hashes
- `banner-injector.js` — JavaScript module to inject overlays dynamically
- `style.css` — Branded visual styling for overlays

## 🔗 Integration Flow

1. Tampermonkey script triggers a TraceForge CLI module
2. `connect/audit` logs and verifies the event
3. `connect/banners` displays CLI banner
4. Overlay is injected into the browser via `banner-injector.js`
5. Optional: user confirms or interacts with the overlay

## 🛡️ Security Notes

- Overlays are sandboxed and scoped to specific domains
- Session metadata is hashed and timestamped
- Audit logs are stored locally or piped to CLI for verification

## 🧠 Author

Savage Services LLC — Modular CLI identity, browser-to-shell automation, and restoration-grade overlays.