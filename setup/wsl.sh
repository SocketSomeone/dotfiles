#!/bin/bash

# WSL-specific setup: bridge to the 1Password SSH agent running on Windows (see tilde/.agent-bridge.sh)

if ! grep -qi microsoft /proc/version 2>/dev/null; then
  exit 0
fi

set -euo pipefail

if ! command -v socat >/dev/null 2>&1; then
  echo "Installing socat…"
  sudo apt-get update
  sudo apt-get install -y socat
fi

if ! command -v npiperelay.exe >/dev/null 2>&1; then
  echo "npiperelay.exe not found in PATH. Install it on Windows: winget install albertony.npiperelay"
fi
