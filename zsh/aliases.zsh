# Directories
alias dotfiles="cd ~/dotfiles"
alias projects="cd ~/projects"
alias work="cd ~/work"

# I use this a lot:
alias shrug="echo '¯\_(ツ)_/¯' | pbcopy | echo '=> Copied to pasteboard.'"

# Include custom aliases
if [[ -f ~/.aliases.local ]]; then
  source ~/.aliases.local
fi
