if [[ -f "$HOME/.cargo/env" ]]; then
  . "$HOME/.cargo/env"
fi

# 1Password SSH agent on WSL: the bridge is started from .zshrc (~/.agent-bridge.sh),
# export the socket here so non-interactive shells can use it too
if [[ -S "$HOME/.ssh/agent.sock" ]]; then
  export SSH_AUTH_SOCK="$HOME/.ssh/agent.sock"
fi
