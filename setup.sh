#!/bin/bash


#
# Prerequisites
# ----------------------------------------------------------

# Sort out auth upfront
sudo -v
while true; do
	sudo -n true;
 	sleep 60;
  	kill -0 "$$" || exit;
done 2>/dev/null &

# Xcode Command Line Tools
xcode-select --install

# Rosetta
sudo softwareupdate --install-rosetta

# Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
eval "$(/opt/homebrew/bin/brew shellenv)"
brew update

# wget
brew install wget


#
# Utilities
# ----------------------------------------------------------

# fzf
brew install fzf

# GnuPG
brew install gpg2

# Mullvad
brew install --cask mullvadvpn

# pinentry
brew install pinentry-mac

# ripgrep
# May need to be installed with:
# arch -arm64 brew install ripgrep
brew install ripgrep

# Starship shell prompt
brew install starship


#
# Development stack
# ----------------------------------------------------------

# MongoDB
brew tap mongodb/brew
brew install mongodb-community@6.0
brew services start mongodb-community@6.0

# NVM (Node.js)
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && \
	printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# Rust
curl --proto "=https" --tlsv1.2 -sSf https://sh.rustup.rs | sh
rustup toolchain install nightly


#
# Development tools
# ----------------------------------------------------------

# Alacritty terminal
brew install alacritty

# Firefox Developer Edition
brew install --cask firefox@developer-edition

# Google Chrome
brew install google-chrome

# GitHub Desktop
wget https://central.github.com/deployments/desktop/desktop/latest/darwin \
	-O "$HOME/Downloads/github-desktop.zip" \
	&& unzip "$HOME/Downloads/github-desktop.zip" -d "$HOME/Downloads/" \
	&& rm "$HOME/Downloads/github-desktop.zip" \
	&& sudo mv "$HOME/Downloads/GitHub Desktop.app" "/Applications/GitHub Desktop.app"

# Neovim
brew install neovim

# Sublime Text
wget https://download.sublimetext.com/sublime_text_build_4143_mac.zip \
	-O "$HOME/Downloads/sublime-text-build.zip" \
	&& unzip "$HOME/Downloads/sublime-text-build.zip" -d "$HOME/Downloads/" \
	&& rm "$HOME/Downloads/sublime-text-build.zip" \
	&& sudo mv "$HOME/Downloads/Sublime Text.app" "/Applications/Sublime Text.app"

# Sublime Text 4 Package Control
wget "https://packagecontrol.io/Package Control.sublime-package" \
 	-P "$HOME/Library/Application Support/Sublime Text/Installed Packages/"


#
# Miscellaneous
# ----------------------------------------------------------

# Discord
brew install --cask discord

# Enpass
brew install --cask enpass

# Firefox
brew install --cask firefox

# Hack nerd font
sudo wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/Hack.zip \
	-O "/Library/Fonts/hack-nerd-font.zip" \
	&& sudo unzip "/Library/Fonts/hack-nerd-font.zip" \
	-d "/Library/Fonts/hack-nerd-font" \
	&& sudo rm "/Library/Fonts/hack-nerd-font.zip"

# ImageOptim
brew install --cask imageoptim

# KMonad
git clone --recursive https://github.com/kmonad/kmonad.git
(cd kmonad/ && \
	open c_src/mac/Karabiner-DriverKit-VirtualHIDDevice/dist/Karabiner-DriverKit-VirtualHIDDevice-3.1.0.pkg)
(cd kmonad/ && \
	/Applications/.Karabiner-VirtualHIDDevice-Manager.app/Contents/MacOS/Karabiner-VirtualHIDDevice-Manager activate)

# Obsidian
brew install --cask obsidian

# OpenMTP
brew install openmtp --cask

# SD Memory Card Formatter
wget https://www.sdcard.org/downloads/formatter/eula_mac/SDCardFormatterv5_Mac.zip \
	-O "SDCardFormatter.zip" \
	&& unzip "SDCardFormatter.zip" -d "$HOME/Downloads/" \
	&& rm "SDCardFormatter.zip" \
	&& sudo installer -pkg "$HOME/Downloads/SDCardFormatterv5_Mac/Install SD Card Formatter 5.0.2.mpkg" -target /

# Sketch
brew install --cask sketch

# Thunderbird
brew install --cask thunderbird

# VLC Player
brew install --cask vlc


#
# System preferences
# ----------------------------------------------------------

# Dock
defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock mineffect suck
defaults write com.apple.dock static-only -bool true

# Finder
defaults write com.apple.finder QuitMenuItem -bool true
defaults write com.apple.finder _FXSortFoldersFirst -bool true
# Open finder window when a volume is mounted
defaults write com.apple.frameworks.diskimages auto-open-ro-root -bool true
defaults write com.apple.frameworks.diskimages auto-open-rw-root -bool true
defaults write com.apple.finder OpenWindowForNewRemovableDisk -bool true
# Show file extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true
# Don't create .DS_Store files on network and external volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

# Keyboard
defaults write NSGlobalDomain NSAutomaticPeriodSubstitutionEnabled -bool false

# Track-pad
defaults write com.apple.AppleMultitouchTrackpad Clicking -bool true
defaults -currentHost write -g com.apple.mouse.tapBehavior -int 1
defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false

# Menu bar
defaults write com.apple.controlcenter BatteryShowPercentage -bool true

# Display
# Use sub-pixel font rendering on external monitors
defaults write NSGlobalDomain AppleFontSmoothing -int 1
# HiDPI display mode
sudo defaults write /Library/Preferences/com.apple.windowserver \
	DisplayResolutionEnabled -bool true


#
# Post-setup
# ----------------------------------------------------------

# Generate a GPG key
gpg --default-new-key-algo rsa4096 --gen-key

# Reload updated settings
/System/Library/PrivateFrameworks/SystemAdministration.framework/Resources/activateSettings -u

brew autoremove
brew cleanup
