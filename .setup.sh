#!/bin/bash


#
# Prerequisites
# ----------------------------------------------------------

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

# TODO: Mullvad
# https://mullvad.net/en/download/app/pkg/latest


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
# TODO

# Firefox (developer and standard editions)
# TODO

# GitHub Desktop
# TODO

# Oh My ZSH
sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
chsh -s $(which zsh)

# Starship shell prompt
brew install starship

# Sublime Text
wget https://download.sublimetext.com/sublime_text_build_4143_mac.zip \
	-O "$HOME/Downloads/sublime-text-build.zip" \
	&& unzip ~/Downloads/sublime-text-build.zip -d "$HOME/Downloads/" \
	&& rm "$HOME/Downloads/sublime-text-build.zip" \
	&& sudo mv "$HOME/Downloads/Sublime Text.app" "/Applications/Sublime Text.app"

# ZSH plugins
brew install antigen


#
# Miscellaneous
# ----------------------------------------------------------

# Thunderbird
# TODO


#
# System preferences
# ----------------------------------------------------------


#
# Remap keys
# ----------------------------------------------------------
