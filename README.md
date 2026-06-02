# Dotfiles

This repository contains the scripts and configuration files I use to bootstrap a Windows workstation.  
The setup installs a curated set of desktop tools, configures the Windows shell experience (PowerShell/WT),
and keeps personal application settings versioned inside this repo.

## Repository layout

| Path                                | Description                                                                                                 |
| ----------------------------------- | ----------------------------------------------------------------------------------------------------------- |
| `install/windows.ps1`               | Windows entry point that wires all modules together and orchestrates package installs + symlink creation.   |
| `install/linux.sh`                  | Linux entry point that runs package, link, and OS configuration scripts.                                    |
| `install/wsl.sh`                    | Compatibility wrapper that currently delegates to `install/linux.sh`.                                       |
| `lib/windows/*.psm1`                | Internal helper modules (logging, filesystem helpers, shared constants, confirmation prompts, etc.).        |
| `lib/linux/*.sh`                    | Internal Linux helper scripts used by the Bash installer.                                                   |
| `packages/packages.json`            | WinGet import manifest for desktop software (Docker, VS Code, JetBrains Toolbox, etc.).                     |
| `packages/winget.sync-packages.ps1` | Script invoked by the installer to import the WinGet manifest.                                              |
| `packages/linux/*.sh`               | Optional Linux package installation scripts.                                                               |
| `links/*.ps1`                       | One script per app that installs modules/fonts (PowerShell) or creates symlinks beneath `%USERPROFILE%`.    |
| `links/linux/*.sh`                  | Optional Linux link scripts, including GNU Stow-based links.                                               |
| `os/linux/*.sh`                     | Optional Linux OS configuration scripts.                                                                   |
| `config/**`                         | The actual dotfiles that get linked (PowerShell profile, Git config, WSL, Windows Terminal, GoXLR presets). |

## Requirements

- Windows 11 with administrative access.
- PowerShell 7+ (for modules like `Install-Module`, `oh-my-posh`, `winget` CLI, etc.).
- WinGet installed (included with modern Windows builds).

## Bootstrap the machine

```powershell
git clone https://github.com/SocketSomeone/dotfiles.git $env:USERPROFILE\dotfiles
cd $env:USERPROFILE\dotfiles
Set-ExecutionPolicy -Scope Process -ExecutionPolicy RemoteSigned
pwsh -File .\install\windows.ps1           # add -Debug to trace every step
```

What the installer does:

1. Imports helper modules from `lib/windows`.
2. Runs every script under `packages/` (currently just the WinGet import) to ensure required software is present.
3. Executes all scripts under `links/` to create symlinks for configuration files/directories and to install shell modules/fonts.

## Bootstrap Linux

Run this from inside Linux or a WSL distribution:

```bash
git clone https://github.com/SocketSomeone/dotfiles.git ~/dotfiles
cd ~/dotfiles
bash install/linux.sh
exec bash
```

For WSL, `bash install/wsl.sh` is also available as a compatibility wrapper. If the repo is already cloned on the Windows side, you can run the script from the mounted checkout, for example
`/mnt/c/Users/<windows-user>/dotfiles`.

What the Linux installer does:

1. Imports helper scripts from `lib/linux`.
2. Runs every script under `packages/linux`.
3. Runs every script under `links/linux`.
4. Runs every script under `os/linux`.

Add future Linux-specific setup as small `.sh` scripts in `packages/linux`, `links/linux`, or `os/linux`. Link scripts can use
the Stow helper from `lib/linux/stow.sh`.

## Customizing

- **Package list** – Add/remove WinGet identifiers in `packages/packages.json`, then rerun the installer or
  invoke `packages/winget.sync-packages.ps1` manually to apply the changes.
- **PowerShell profile** – Edit `config/pwsh/Microsoft.PowerShell_profile.ps1` to tweak modules,
  `PSReadLine` bindings, or the `oh-my-posh` theme name stored in `$THEME`.
- **Other apps** – Adjust files under `config/git`, `config/wt`, `config/wsl`, or create new `links/*.ps1`
  scripts if you want to manage more applications.

## Tips

- The symlink helper prompts before overwriting existing files; rerun a specific script from `links/`
  if you need to relink without running the full installer.
- Use the `-Debug` switch when launching `install/windows.ps1` to see every command/path the bootstrapper touches.
- Because the repo stores plain text configuration, it's easy to track changes with Git across machines.

## Stay in touch

* Author - [Alexey Filippov](https://t.me/socketsomeone)
* Twitter - [@SocketSomeone](https://twitter.com/SocketSomeone)

## License

[MIT](https://github.com/SocketSomeone/dotfiles/blob/master/LICENSE) © [Alexey Filippov](https://github.com/SocketSomeone)
