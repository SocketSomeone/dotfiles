export SSH_AUTH_SOCK="$HOME/.ssh/agent.sock"

mkdir -p "$(dirname "$SSH_AUTH_SOCK")"

ALREADY_RUNNING=1

if pgrep -f "socat UNIX-LISTEN:$SSH_AUTH_SOCK.*openssh-ssh-agent" >/dev/null; then
    if ssh-add -l >/dev/null 2>&1; then
        ALREADY_RUNNING=0
    fi
fi

if [[ "$ALREADY_RUNNING" != "0" ]]; then
    pkill -f "socat UNIX-LISTEN:$SSH_AUTH_SOCK" 2>/dev/null
    rm -f "$SSH_AUTH_SOCK"

    setsid socat \
        UNIX-LISTEN:"$SSH_AUTH_SOCK",fork \
        EXEC:"npiperelay.exe -ei -s //./pipe/openssh-ssh-agent",nofork \
        >/dev/null 2>&1 &
fi

WIN_HOME="$(wslpath "$(cmd.exe /c "echo %USERPROFILE%" 2>/dev/null | tr -d '\r')")"

SRC="$WIN_HOME/.ssh"
DST="$HOME/.ssh"

install -d -m 700 "$DST" "$DST/1Password"

cp "$SRC/config" "$DST/config"
cp -a "$SRC/1Password/." "$DST/1Password/"

chmod 600 "$DST/config"
find "$DST/1Password" -type d -exec chmod 700 {} +
find "$DST/1Password" -type f -exec chmod 600 {} +
