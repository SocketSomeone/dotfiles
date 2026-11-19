#!/bin/bash

# Some macOS-specific defaults and tweaks. Run this after installing packages with Homebrew.

if [[ "$(uname -s)" == "Darwin" ]]; then
  echo "Configuring macOS with sane defaults…"
  echo
else
  exit 0
fi
