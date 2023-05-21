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
sudo update-grub




#
# Sublime Text 4
#

# Install Package Control
wget 'https://packagecontrol.io/Package Control.sublime-package' \
	-P "$HOME/.config/sublime-text/Installed Packages/"




#
# Gnome Terminal
#
GNOME_TERMINAL_PROFILE=`gsettings get org.gnome.Terminal.ProfilesList default | awk -F \' '{print $2}'`
gsettings set org.gnome.Terminal.Legacy.Settings always-check-default-terminal false
gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$GNOME_TERMINAL_PROFILE/ \
	font 'Hack Nerd Font 11'

# Gogh themes
# Note to self: I liek the "Bluloco Light" one at the moment
bash -c "$(wget -qO- https://git.io/vQgMr)"
