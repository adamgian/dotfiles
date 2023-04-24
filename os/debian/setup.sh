#!/bin/bash

sudo apt update && sudo apt upgrade -y

# Theme/enhancements:
sudo apt install dconf-editor
sudo apt install fonts-hack-ttf
sudo apt install gnome-shell-extension-manager
sudo apt install gnome-tweaks

# Utilities
sudo apt install timeshift
sudo apt install flatpak

# Development:
# NVM (Node.js)
wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && \
	printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
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

# Other:
# Firefox
sudo apt install firefox-esr
sudo apt install webext-privacy-badger
sudo apt install webext-ublock-origin-firefox
# Thunderbird
sudo apt install thunderbird
# Enpass
echo "deb https://apt.enpass.io/ stable main" > \
	sudo /etc/apt/sources.list.d/enpass.list
wget -O - https://apt.enpass.io/keys/enpass-linux.key | \
	tee /etc/apt/trusted.gpg.d/enpass.asc
sudo apt update && sudo apt install enpass




#
# Removing apps and tools that are not used
#
sudo apt remove cheese
sudo apt remove evolution
sudo apt remove gnome-color-manager
sudo apt remove gnome-games
sudo apt remove gnome-sound-recorder
sudo apt remove gnome-weather
sudo apt remove rhythmbox
sudo apt remove shotwell
sudo apt remove simple-scan
sudo apt remove transmission-gtk
sudo apt remove yelp




#
# Final clean up
#
sudo apt autoremove




#
# Faster boot up time
#

# Grub bootloader:
# Don't wait for user input or show options
sudo sed -i '/^GRUB_TIMEOUT/s/=.*$/=0/' /etc/default/grub
# Log fewer lines
sudo sed -i '/^GRUB_CMDLINE_LINUX_DEFAULT/s/=.*$/="quiet loglevel=3"/' /etc/default/grub
# Disable graphical terminal, render text only
sudo sed -i 's/^#GRUB_TERMINAL/GRUB_TERMINAL/' /etc/default/grub
sudo update-grub2

# No need to wait for the network (for me anyway)
sudo systemctl disable NetworkManager-wait-online.service
