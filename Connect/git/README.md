# 🧬 TraceForge Git Integration

This directory contains scripts and templates for integrating Git into TraceForge CLI workflows.

## Features

- Branded commit messages with session metadata
- Post-run hooks for `identify`, `restore`, `manifest`
- Config bundle sync logic
- Optional push to remote audit repo

## Usage

```bash
traceforge-git.sh commit restore RS-20251009-02:10
traceforge-git.sh sync
traceforge-git.sh push