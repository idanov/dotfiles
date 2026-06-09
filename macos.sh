#!/usr/bin/env bash
# Run once when setting up a new Mac: bash macos.sh
set -euo pipefail

echo "Configuring macOS defaults..."

# ── Keyboard ─────────────────────────────────────────────────────────────────
# Disable press-and-hold (enables key repeat in all apps)
defaults write -g ApplePressAndHoldEnabled -bool false
# Fast key repeat (lower = faster; 15 = ~225ms initial, 2 = ~30ms repeat)
defaults write -g InitialKeyRepeat -int 15
defaults write -g KeyRepeat -int 2

# ── Trackpad / Mouse ──────────────────────────────────────────────────────────
# Enable tap-to-click
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
# Disable natural scrolling (traditional/normal direction)
defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false
# Disable three-finger tap (look up & data detectors)
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadThreeFingerTapGesture -int 0

# ── Finder ────────────────────────────────────────────────────────────────────
# Show all file extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true
# Show hidden files
defaults write com.apple.finder AppleShowAllFiles -bool true
# Show path bar and status bar
defaults write com.apple.finder ShowPathbar -bool true
defaults write com.apple.finder ShowStatusBar -bool true
# Default to list view
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"
# Search current folder by default
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"
# Disable .DS_Store on network/USB volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

# ── Dock ──────────────────────────────────────────────────────────────────────
# Position on the left
defaults write com.apple.dock orientation -string "left"
# Auto-hide the Dock
defaults write com.apple.dock autohide -bool true
# Remove auto-hide delay
defaults write com.apple.dock autohide-delay -float 0
# Don't show recent apps in Dock
defaults write com.apple.dock show-recents -bool false

# ── Screenshots ───────────────────────────────────────────────────────────────
# Save to ~/Documents
defaults write com.apple.screencapture location -string "~/Documents/"
# Save as PNG
defaults write com.apple.screencapture type -string "png"
# Disable shadow
defaults write com.apple.screencapture disable-shadow -bool true

# ── Safari / WebKit ───────────────────────────────────────────────────────────
# Show full URL in address bar
defaults write com.apple.Safari ShowFullURLInSmartSearchField -bool true

# ── Activity Monitor ──────────────────────────────────────────────────────────
# Show all processes
defaults write com.apple.ActivityMonitor ShowCategory -int 0

# ── Misc ──────────────────────────────────────────────────────────────────────
# Disable automatic capitalisation, smart quotes, smart dashes
defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false
# Expand save and print dialogs by default
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true

# ── Rosetta ───────────────────────────────────────────────────────────────────
if [[ "$(uname -m)" == "arm64" ]] && ! /usr/bin/pgrep -q oahd; then
  echo "Installing Rosetta..."
  softwareupdate --install-rosetta --agree-to-license
fi

# Apply changes
echo "Restarting affected apps..."
for app in Finder Dock SystemUIServer; do
  killall "$app" &>/dev/null || true
done

echo "Done. Some changes may require a logout/restart to take effect."
