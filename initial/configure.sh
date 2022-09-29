#!/usr/bin/env bash


######################################
## Built-in settings customization ###
######################################

# Make sure you are running this script as your desired user
# sudo adduser --home /home/<username> --shell /bin/zsh <username>
# passwd <username>

# Keyboard configuration
# Choose "Generic 105-key PC", then "French (Canada)", then spam <Enter> thrice.
sudo dpkg-reconfigure keyboard-configuration
# Then reboot or run this
# sudo reboot now
sudo service keyboard-setup restart

# Force one-line by default on zsh:
# Locate the line below and edit the PROMPT_ALTERNATIVE variable just below it to PROMPT_ALTERNATIVE=oneline
# START KALI CONFIG VARIABLES

#######################
## Folder Structure ###
#######################

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

######################
## Custom Packages ###
######################

sudo apt update

# Gnome desktop environment
sudo apt install kali-desktop-gnome
# Select lightdm as the display manager, NOT gdm3.
sudo update-alternatives --config x-session-manager
# It is recommended to reboot after this.

# Terminator
sudo apt install terminator

# Tidal-Hifi - Get latest build here:
# https://github.com/Mastermindzh/tidal-hifi/releases

# nmap-parse-output
# https://github.com/ernw/nmap-parse-output
echo 'autoload bashcompinit && bashcompinit && source ~/Github/nmap-parse-output/_nmap-parse-output' >> ~.zshrc

# see sources.list.d folder for apt sources for Google Chrome and VSCode.

# Nvidia drivers
# These are the two that will contain all the required dependencies for hashcat to detect the GPU.
# Adjust driver version accordingly and hope for no errors :)
sudo apt install nvidia-tesla-510-driver nvidia-cuda-toolkit
