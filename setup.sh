#!/bin/bash


#
# Prerequisites
# ----------------------------------------------------------

# Sort out auth upfront
sudo -v
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Xcode Command Line Tools
xcode-select --install

# Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew update
eval "$(/opt/homebrew/bin/brew shellenv)"

# wget
brew install wget


#
# Utilities
# ----------------------------------------------------------

# Mullvad
brew install --cask mullvadvpn

# Oh My ZSH
sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
chsh -s $(which zsh)

# pinentry
brew install pinentry-mac

# ripgrep
$ brew install ripgrep

# Starship shell prompt
brew install starship

# ZSH plugins
brew install antigen


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

# Google Chrome
brew install google-chrome

# Firefox Developer Edition
brew install --cask firefox@developer-edition

# GitHub Desktop
wget https://central.github.com/deployments/desktop/desktop/latest/darwin \
	-O "$HOME/Downloads/github-desktop.zip" \
	&& unzip "$HOME/Downloads/github-desktop.zip" -d "$HOME/Downloads/" \
	&& rm "$HOME/Downloads/github-desktop.zip" \
	&& sudo mv "$HOME/Downloads/GitHub Desktop.app" "/Applications/GitHub Desktop.app"

# Sublime Text
wget https://download.sublimetext.com/sublime_text_build_4143_mac.zip \
	-O "$HOME/Downloads/sublime-text-build.zip" \
	&& unzip "$HOME/Downloads/sublime-text-build.zip" -d "$HOME/Downloads/" \
	&& rm "$HOME/Downloads/sublime-text-build.zip" \
	&& sudo mv "$HOME/Downloads/Sublime Text.app" "/Applications/Sublime Text.app"


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

# Keyboard
defaults write NSGlobalDomain NSAutomaticPeriodSubstitutionEnabled -bool false

# Track-pad
defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false
defaults write com.apple.trackpad.forceClick -bool false


#
# Post-setup
# ----------------------------------------------------------

brew autoremove
brew cleanup
