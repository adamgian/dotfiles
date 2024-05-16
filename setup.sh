#!/bin/bash


#
# Preparation
# ----------------------------------------------------------

# Sort out auth upfront
sudo -v
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

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

sudo apt update && sudo apt upgrade -y
sudo apt install curl
sudo apt install libclang-dev


#
# Utilities
# ----------------------------------------------------------

# Dconf Editor
sudo apt install dconf-editor

# Flatpak
sudo apt install flatpak
sudo apt install gnome-software-plugin-flatpak
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# GNOME Shell extension manager
sudo apt install gnome-shell-extension-manager

# GNOME Tweak Tool
sudo apt install gnome-tweaks

# Mullvad
sudo curl -fsSLo /usr/share/keyrings/mullvad-keyring.asc \
	https://repository.mullvad.net/deb/mullvad-keyring.asc
echo "deb [signed-by=/usr/share/keyrings/mullvad-keyring.asc \
	arch=$( dpkg --print-architecture )] \
	https://repository.mullvad.net/deb/stable $(lsb_release -cs) main" \
	| sudo tee /etc/apt/sources.list.d/mullvad.list
sudo apt install mullvad-vpn

# Oh My ZSH
sudo apt install zsh
sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
chsh -s $(which zsh)

# Preload
sudo apt install preload

# ripgrep
sudo apt install ripgrep

# Starship shell prompt
curl -sS https://starship.rs/install.sh | sh

# Timeshift
sudo apt install timeshift

# uuid-runtime
sudo apt install uuid-runtime

# ZSH plugins
curl -L git.io/antigen > $HOME/antigen.zsh


#
# Development stack
# ----------------------------------------------------------

# MongoDB
# TODO

# NVM (Node.js)
wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash
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
git clone https://github.com/alacritty/alacritty.git
cd alacritty
apt install cmake pkg-config libfreetype6-dev libfontconfig1-dev \
	libxcb-xfixes0-dev libxkbcommon-dev python3
cargo build --release
sudo tic -xe alacritty,alacritty-direct extra/alacritty.info
sudo cp target/release/alacritty /usr/local/bin
sudo cp extra/logo/alacritty-term.svg /usr/share/pixmaps/Alacritty.svg
sudo desktop-file-install extra/linux/Alacritty.desktop
sudo update-desktop-database
cd ../
rm -rf alacritty

# Firefox Developer Edition
# TODO
# https://download.mozilla.org/?product=firefox-devedition-latest-ssl&os=linux64&lang=en-US

# GitHub Desktop
wget -qO - https://apt.packages.shiftkey.dev/gpg.key | \
	gpg --dearmor | \
	sudo tee /usr/share/keyrings/shiftkey-packages.gpg > /dev/null
sudo sh -c \
	'echo "deb [arch=amd64 signed-by=/usr/share/keyrings/shiftkey-packages.gpg] \
	https://apt.packages.shiftkey.dev/ubuntu/ any main" > \
	/etc/apt/sources.list.d/shiftkey-packages.list'
sudo apt update && sudo apt install github-desktop

# Google Chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt install ./google-chrome-stable_current_amd64.deb

# Sublime Text 4
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | \
	gpg --dearmor | \
	sudo tee /etc/apt/trusted.gpg.d/sublimehq-archive.gpg > /dev/null
echo "deb https://download.sublimetext.com/ apt/stable/" | \
	sudo tee /etc/apt/sources.list.d/sublime-text.list
sudo apt update && sudo apt install sublime-text

# Sublime Text 4 Package Control
wget "https://packagecontrol.io/Package Control.sublime-package" \
	-P "$HOME/.config/sublime-text/Installed Packages/"


#
# Miscellaneous
# ----------------------------------------------------------

# Celluloid
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

# Hack nerd font
sudo wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/Hack.zip \
	-O "/usr/share/fonts/truetype/hack-nerd-font.zip" \
	&& sudo unzip "/usr/share/fonts/truetype/hack-nerd-font.zip" \
	-d "/usr/share/fonts/truetype/hack-nerd-font" \
	&& sudo rm "/usr/share/fonts/truetype/hack-nerd-font.zip"

# Handbrake
flatpak install flathub fr.handbrake.ghb

# Thunderbird
sudo apt install thunderbird

# UFW
sudo apt install ufw
sudo ufw enable


#
# System preferences
# ----------------------------------------------------------

# Start week on Monday
sudo sed -i "/^END LC_TIME/ifirst_weekday 2" /usr/share/i18n/locales/en_AU

# Grub bootloader:
# Don't wait for user input or show options
sudo sed -i "/^GRUB_TIMEOUT/s/=.*$/=0/" /etc/default/grub
# Log fewer lines
sudo sed -i '/^GRUB_CMDLINE_LINUX_DEFAULT/s/=.*$/="quiet loglevel=3"/' /etc/default/grub
# Disable graphical terminal, render text only
sudo sed -i "s/^#GRUB_TERMINAL/GRUB_TERMINAL/" /etc/default/grub
sudo update-grub


#
# Post-setup
# ----------------------------------------------------------

# Clean up packages/dependencies
sudo apt autoremove
