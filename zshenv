# ~/.zshenv – sourced for ALL zsh sessions (interactive, non-interactive, login, scripts)
# Keep this lean and fast: no interactive features, no slow subprocesses.
# This is the only file Neovide (and other GUI apps) reliably source.

# Essential environment variables
export DO_NOT_TRACK=1
export EDITOR="vim"
export VISUAL="nvim"
export BAT_THEME="TwoDark"
export HOMEBREW_NO_ANALYTICS=1
export MISE_ENV_FILE=.env

# Homebrew (Apple Silicon) — hardcoded path avoids a slow `brew shellenv` subprocess
export PATH="/opt/homebrew/bin:/opt/homebrew/sbin${PATH:+:$PATH}"

# Core paths
export PATH="$HOME/.dotfiles/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"

# Rust / Cargo
[[ -f "$HOME/.cargo/env" ]] && . "$HOME/.cargo/env"

# pnpm
export PNPM_HOME="$HOME/Library/pnpm"
[[ ":$PATH:" != *":$PNPM_HOME:"* ]] && export PATH="$PNPM_HOME:$PATH"

# mise shims — makes mise-managed tools available in all sessions (including Neovide).
# In interactive shells, `mise activate zsh` in .zshrc layers on top of this.
export PATH="$HOME/.local/share/mise/shims:$PATH"
