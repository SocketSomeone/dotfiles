#!/usr/bin/env zsh

# Antigen path
ANTIGEN="$HOME/antigen.zsh"

# Download Antigen if it is missing or empty
if [[ ! -s "$ANTIGEN" ]]; then
  echo "Antigen not found, downloading..."

  if command -v curl >/dev/null 2>&1; then
    curl -fsSL https://git.io/antigen -o "$ANTIGEN"
  elif command -v wget >/dev/null 2>&1; then
    wget -q https://git.io/antigen -O "$ANTIGEN"
  else
    echo "Error: curl or wget is required to download Antigen."
  fi
fi

autoload -Uz compinit
compinit -i

# Load Antigen
source "$ANTIGEN"

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

antigen bundle unixorn/autoupdate-antigen.zshplugin
antigen bundle zsh-users/zsh-autosuggestions # Autocompletions
antigen bundle zsh-users/zsh-syntax-highlighting # Syntax highlighting bundle.
antigen bundle zsh-users/zsh-completions

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle heroku
antigen bundle pip
antigen bundle lein
antigen bundle nvm
antigen bundle command-not-found

# Load the theme.
antigen theme robbyrussell

# Tell Antigen that you're done.
antigen apply
