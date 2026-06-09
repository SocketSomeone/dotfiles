#!/bin/bash

set -euo pipefail

cd "$(dirname $0)"

red=$(tput setaf 1)
green=$(tput setaf 2)
yellow=$(tput setaf 3)
light_red=$(tput setaf 9)
bold=$(tput bold)
reset=$(tput sgr0)

title() {
  echo "${bold}==> $1${reset}"
  echo
}

warning() {
  tput setaf 1
  echo "/!\\ $1 /!\\"
  tput sgr0
}

command_exists() {
  command -v "$@" &> /dev/null
}

echo -e "
${yellow}
 ______________________________________
|                                      |
|  Welcome to @socketsomeone dotfiles  |
|______________________________________|
"
echo
echo -e "${yellow}!!! ${red}WARNING${yellow} !!!"
echo -e "${light_red}This script will delete all your configuration files!"
echo -e "${light_red}Use it at your own risk."

if [ $# -ne 1 ] || [ "$1" != "-y" ]; then
  echo -e "${yellow}Press Enter key to continue…${reset}\n"
  read key
fi

# Backup existing zsh file
if [[ -e "$HOME/.zshrc" ]]; then
  mv "$HOME/.zshrc" "$HOME/.zshrc.backup"
fi

# Use Touch ID to authorize sudo
if [ ! -f /etc/pam.d/sudo_local ]; then
  title "🔒 Enabling Touch ID to authorize sudo commands…"
  echo "auth       sufficient     pam_tid.so" | sudo tee /etc/pam.d/sudo_local
fi

# Ask for the administrator password upfront
warning "Activate sudo"
sudo echo "Sudo activated!"
echo

# Install Homebrew and packages/apps
title "🫖 Setting up Homebrew…"
~/dotfiles/setup/brew.sh
echo

# Setup Zsh and register it as a default shell
title "🐚 Setting up Zsh…"
~/dotfiles/setup/zsh.sh
echo

# OS Changes
title "🚀 Setting up OS defaults…"
~/dotfiles/setup/os.sh
echo

# Install dotfiles symlinks
title "🍤 Setting up symlinks…"
~/dotfiles/setup/symlinks.sh
echo

echo "🦏 ${green}All done! Open a new terminal for the changes to take effect or run: source ~/.zshrc.${reset}"
