#!/bin/bash

EXCLUDED_FILES=(
  ".wslconfig"
  ".env"
  ".secret"
)

IGNORE_PATTERN="$(IFS='|'; echo "${EXCLUDED_FILES[*]}")"
DOTFILES="$HOME/dotfiles"

STOW_ARGS=(
  --target="$HOME"
  --ignore="^(${IGNORE_PATTERN})$"
  -d "$DOTFILES"
  tilde
)

yellow=$(tput setaf 3 2>/dev/null)
reset=$(tput sgr0 2>/dev/null)

# Ask stow (dry run) which existing files or foreign links would conflict
mapfile -t CONFLICTS < <(
  stow -n "${STOW_ARGS[@]}" 2>&1 | sed -n \
    -e 's/.* over existing target \(.*\) since .*/\1/p' \
    -e 's/.*existing target is not owned by stow: \(.*\)$/\1/p'
)

# Move them aside so stow can link the whole package
BACKUPS=()
suffix="backup.$(date +%Y%m%d%H%M%S)"
for target in "${CONFLICTS[@]}"; do
  mv "$HOME/$target" "$HOME/$target.$suffix"
  BACKUPS+=("~/$target → ~/$target.$suffix")
done

stow "${STOW_ARGS[@]}" || exit 1

if (( ${#BACKUPS[@]} )); then
  echo
  echo "${yellow}Dotfiles: these files were in the way of symlinks and have been moved aside:${reset}"
  printf '  %s\n' "${BACKUPS[@]}"
  echo "${yellow}Compare with: diff ~/<file>.$suffix ~/<file>${reset}"
fi
