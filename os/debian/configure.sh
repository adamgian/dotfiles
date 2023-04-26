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
wget 'https://packagecontrol.io/Package Control.sublime-package' \
	-P "$HOME/.config/sublime-text/Installed Packages/"
