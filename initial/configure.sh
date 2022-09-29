#!/usr/bin/env bash

# Make sure you are running this script as your desired user
# sudo adduser --home /home/<username> --shell /bin/zsh <username>
# passwd <username>

# Gnome desktop environment
sudo apt install kali-desktop-gnome
sudo update-alternatives --config x-session-manager
# It is recommended to reboot after this.

# Keyboard configuration
# Choose "Generic 105-key PC", then "French (Canada)", then spam <Enter> thrice.
sudo dpkg-reconfigure keyboard-configuration
# Then reboot or run this
# sudo reboot now
sudo service keyboard-setup restart

mkdir -p ~/Github/me
# Clone your github repos in there.
# Created a subfolder for my personal repos so that I don't battle against autocomplete if I clone too many random repos over time.

mkdir -p ~/OSCP/Labs
mkdir ~/OSCP/Exercises

# Create repos for your temporary servers. These will be accessed by victim PCs.
mkdir -p ~/server/http
mkdir ~/server/smb

# This will contain all the .ovpn files.
mkdir ~/VPN


# TODO: Custom packages (terminator, gnome, tidal, etc.)
