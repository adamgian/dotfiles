#!/bin/bash


#
# Improve boot up times
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




#
# Sublime Text 4
#

# Install Package Control
wget https://packagecontrol.io/Package%20Control.sublime-package \
	-P ~/FIXME

# "A File Icon" icons
wget https://github.com/SublimeText/AFileIcon/archive/refs/tags/3.22.0.zip \
	-P "$HOME/Downloads/"
unzip "$HOME/Downloads/3.22.0.zip" -d "$HOME/Downloads/" \
	&& mv "$HOME/Downloads/AFileIcon-3.22.0" \
		"$HOME/FIXME/Sublime Text 3/Packages/A File Icon/" \
	&& rm ~/Downloads/3.22.0.zip

# BracketHighlighter

# Oceanic Next color theme
wget https://raw.githubusercontent.com/voronianski/oceanic-next-color-scheme/master/Oceanic%20Next.tmTheme \
	-P "$HOME/FIXME/Sublime Text 3/Packages/User/"
