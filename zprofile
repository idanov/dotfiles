# ~/.zprofile – sourced for login shells, after .zshenv
# Runs the full Homebrew shellenv to set HOMEBREW_* vars, MANPATH, and INFOPATH.
# The PATH entries are already set in .zshenv; this just fills in the rest.
eval "$(/opt/homebrew/bin/brew shellenv zsh)"
