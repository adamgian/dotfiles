#!/bin/bash


#
# Removing apps and tools that are not used
#
sudo apt remove cheese
sudo apt remove evolution
sudo apt remove firefox-esr # Re-installing this
sudo apt remove gnome-color-manager
sudo apt remove gnome-games
sudo apt remove gnome-sound-recorder
sudo apt remove gnome-weather
sudo apt remove rhythmbox
sudo apt remove shotwell
sudo apt remove simple-scan
sudo apt remove totem
sudo apt remove transmission-gtk
sudo apt remove yelp




#
# Preparation
#
sudo apt update && sudo apt upgrade -y




#
# Theme/enhancements:
#
sudo apt install dconf-editor
sudo apt install fonts-hack-ttf
sudo apt install gnome-shell-extension-manager
sudo apt install gnome-tweaks

#
# Utilities:
#
sudo apt install flatpak
sudo apt install preload
sudo apt install timeshift




#
# Development tools:
#

# Sublime Text
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | \
	gpg --dearmor | \
	sudo tee /etc/apt/trusted.gpg.d/sublimehq-archive.gpg > \
	/dev/null
echo "deb https://download.sublimetext.com/ apt/stable/" | \
	sudo tee /etc/apt/sources.list.d/sublime-text.list
sudo apt update && sudo apt install sublime-text

# GitHub Desktop
wget -qO - https://apt.packages.shiftkey.dev/gpg.key | \
	gpg --dearmor | \
	sudo tee /usr/share/keyrings/shiftkey-packages.gpg > /dev/null
sudo sh -c \
	'echo "deb [arch=amd64 signed-by=/usr/share/keyrings/shiftkey-packages.gpg] \
	https://apt.packages.shiftkey.dev/ubuntu/ any main" > \
	/etc/apt/sources.list.d/shiftkey-packages.list'
sudo apt update && sudo apt install github-desktop




#
# Development stack:
#

# NVM (Node.js)
wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && \
	printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# MongoDB
# TODO




#
# Other:
#

# Celluloid
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak install flathub io.github.celluloid_player.Celluloid

# Enpass
echo "deb https://apt.enpass.io/ stable main" > \
	sudo /etc/apt/sources.list.d/enpass.list
wget -O - https://apt.enpass.io/keys/enpass-linux.key | \
	tee /etc/apt/trusted.gpg.d/enpass.asc
sudo apt update && sudo apt install enpass

# Firefox
sudo apt install firefox-esr
sudo apt install webext-privacy-badger
sudo apt install webext-ublock-origin-firefox

# Thunderbird
sudo apt install thunderbird

# UFW
sudo apt install ufw
sudo ufw enable




#
# Clean up packages/dependencies
#
sudo apt autoremove
