#!/bin/bash




#
# Sublime Text 4
#

# Install Package Control
wget https://packagecontrol.io/Package%20Control.sublime-package \
	-P "$HOME/Library/Application Support/Sublime Text/Installed Packages/"

# "A File Icon" icons
wget https://github.com/SublimeText/AFileIcon/archive/refs/tags/3.22.0.zip \
	-P "$HOME/Downloads/"
unzip "$HOME/Downloads/3.22.0.zip" -d "$HOME/Downloads/" \
	&& mv "$HOME/Downloads/AFileIcon-3.22.0" \
		"$HOME/Library/Application Support/Sublime Text/Packages/A File Icon/" \
	&& rm ~/Downloads/3.22.0.zip

# Oceanic Next color theme
wget https://raw.githubusercontent.com/voronianski/oceanic-next-color-scheme/master/Oceanic%20Next.tmTheme \
	-P "$HOME/Library/Application Support/Sublime Text/Packages/User/"
