#!/bin/bash


#
# Preparation
#

# Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew update

# Xcode Command Line Tools
xcode-select --install

# wget
brew install wget




#
# Development tools
#

# Sublime Text
wget https://download.sublimetext.com/sublime_text_build_4143_mac.zip \
	-O "$HOME/Downloads/sublime-text-build.zip" \
	&& unzip ~/Downloads/sublime-text-build.zip -d "$HOME/Downloads/" \
		&& rm "$HOME/Downloads/sublime-text-build.zip" \
		&& sudo mv "$HOME/Downloads/Sublime Text.app" \
			'/Applications/Sublime Text.app'

# Starship shell prompt
curl -sS https://starship.rs/install.sh | sh




#
# Development stack
#

# NVM (Node.js)
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && \
	printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# MongoDB
brew tap mongodb/brew
brew install mongodb-community@6.0
brew services start mongodb-community@6.0

# Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh




#
# Development tools
#

# Sublime Text
wget https://download.sublimetext.com/sublime_text_build_4143_mac.zip \
	-O "$HOME/Downloads/sublime_text_build.zip"
unzip ~/Downloads/sublime_text_build.zip -d "$HOME/Downloads/" \
	&& rm "$HOME/Downloads/sublime_text_build.zip"
sudo mv "$HOME/Downloads/Sublime Text.app" '/Applications/Sublime Text.app'
