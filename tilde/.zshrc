export DOTFILES="$HOME/.dotfiles"

source "$HOME/dotfiles/zsh/history.zsh"
source "$HOME/dotfiles/zsh/completions.zsh"
source "$HOME/dotfiles/zsh/paths.zsh"
source "$HOME/dotfiles/zsh/env.zsh"
source "$HOME/dotfiles/zsh/aliases.zsh"
source "$HOME/dotfiles/zsh/theme.zsh"
source "$HOME/dotfiles/zsh/functions.zsh"

# Support 1Password with WSL
IS_WSL=$(uname -r | grep -i microsoft)
if [[ -n "$IS_WSL" ]]; then
	source "$HOME/.agent-bridge.sh"
fi

if [[ -f ~/.zshrc.local ]]; then
  source ~/.zshrc.local
fi

if [[ -f ~/.aliases ]]; then
  source ~/.aliases
fi

# . "$HOME/.local/bin/env"
