#!/bin/bash

EXCLUDED_FILES=(
  ".wslconfig"
  ".env"
  ".secret"
)

IGNORE_PATTERN="$(IFS='|'; echo "${EXCLUDED_FILES[*]}")"
DOTFILES="$HOME/dotfiles"

stow \
  --target="$HOME" \
  --ignore="^(${IGNORE_PATTERN})$" \
  -d "$DOTFILES" \
  tilde
