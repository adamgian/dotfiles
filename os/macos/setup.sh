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




#
# Development tools
#

# Sublime Text
wget https://download.sublimetext.com/sublime_text_build_4143_mac.zip \
	-O "$HOME/Downloads/sublime_text_build.zip"
unzip ~/Downloads/sublime_text_build.zip -d ~/Downloads/ \
	&& rm "$HOME/Downloads/sublime_text_build.zip"
sudo /bin/cp -rf "$HOME/Downloads/Sublime Text.app" /Applications/ \
	&& rm -rf "$HOME/Downloads/Sublime Text.app"
