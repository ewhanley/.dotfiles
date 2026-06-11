#!/usr/bin/env bash
#
# macos-defaults.sh — opinionated macOS system tweaks.
# Edit freely. Re-runnable. Some changes need a logout or app relaunch.

set -euo pipefail

# Ask for sudo up front (some commands below need it).
sudo -v

echo "==> Keyboard: fast repeat, no press-and-hold (better for vim/nvim)"
defaults write NSGlobalDomain InitialKeyRepeat -int 15   # lower = shorter delay
defaults write NSGlobalDomain KeyRepeat -int 2           # lower = faster repeat
defaults write -g ApplePressAndHoldEnabled -bool false   # key repeat instead of accent menu

echo "==> Finder: show extensions, path bar, status bar, POSIX path title"
defaults write NSGlobalDomain AppleShowAllExtensions -bool true
defaults write com.apple.finder ShowPathbar -bool true
defaults write com.apple.finder ShowStatusBar -bool true
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"   # search current folder
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"   # list view
defaults write com.apple.finder AppleShowAllFiles -bool true          # show dotfiles

echo "==> Finder: don't write .DS_Store on network/USB volumes"
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

echo "==> Screenshots: save as PNG to ~/Screenshots"
mkdir -p "$HOME/Screenshots"
defaults write com.apple.screencapture location -string "$HOME/Screenshots"
defaults write com.apple.screencapture type -string "png"
defaults write com.apple.screencapture disable-shadow -bool true

echo "==> Dock: autohide, faster, no recents"
defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock autohide-delay -float 0
defaults write com.apple.dock autohide-time-modifier -float 0.15
defaults write com.apple.dock show-recents -bool false
defaults write com.apple.dock mru-spaces -bool false   # don't auto-rearrange Spaces (helps AeroSpace)

echo "==> Trackpad/mouse: tap to click, full-speed tracking"
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults write -g com.apple.mouse.tapBehavior -int 1

echo "==> Misc: expand save/print dialogs, no auto-correct/smart-quotes (code-friendly)"
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false

echo "==> Restarting affected apps (Finder, Dock)…"
for app in Finder Dock SystemUIServer; do
  killall "$app" >/dev/null 2>&1 || true
done

echo "Done. A few settings (keyboard, trackpad) fully apply after logout/restart."
