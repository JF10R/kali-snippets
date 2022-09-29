#!/usr/bin/env bash


echo "######################################"
echo "## Built-in settings customization ###"
echo "######################################"
sleep 2 # Just for the looks.

Make sure you are running this script as your desired user (good time to CTRL+C)
read -s -r -p "Press any key to begin setup."
# sudo adduser --home /home/<username> --shell /bin/zsh <username>
# passwd <username>

echo Keyboard configuration
echo Choose '"Generic 105-key PC" then "French (Canada)", then press <Enter> thrice.'
sleep 1 # This is meant to allow cancelling at any point.
read -s -r -p "Press any key to enter Keyboard configuration."
sudo dpkg-reconfigure keyboard-configuration
# Then reboot or run this
# sudo reboot now
sudo service keyboard-setup restart

echo "Keyboard configuration complete. Might wanna restart for changes to take effect."
echo .
sleep 1 # This is meant to allow cancelling at any point.

echo "Read the file's source to update the terminal to a one-liner by default with PROMPT_ALTERNATIVE=oneline in .zshrc"
sleep 2 # This is meant to allow cancelling at any point.
# Force one-line by default on zsh:
# Locate the line below and edit the PROMPT_ALTERNATIVE variable just below it to PROMPT_ALTERNATIVE=oneline
# START KALI CONFIG VARIABLES

echo "#######################"
echo "## Folder Structure ###"
echo "#######################"
sleep 1 # This is meant to allow cancelling at any point.
mkdir -p ~/Github/me
# Clone your github repos in there.
# Created a subfolder for my personal repos so that I don't battle against autocomplete if I clone too many random repos over time.

mkdir -p ~/OSCP/Labs
mkdir ~/OSCP/Exercises

echo "Creating folders for your temporary servers. These will be accessed by victim PCs."
mkdir -p ~/server/http
mkdir ~/server/smb

# This will contain all the .ovpn files.
mkdir ~/VPN

echo "######################"
echo "## Custom Packages ###"
echo "######################"

echo "Updating all sources and fetching before upgrading."
read -s -r -p "Press any key to keep going."
sleep 2 # This is meant to allow cancelling at any point.
sudo apt update

# Gnome desktop environment
echo "Installing Gnome Desktop."
echo "Make sure to select Lightdm as the desktop manager"
read -s -r -p "Press any key to keep going."
sudo apt install kali-desktop-gnome
# Select lightdm as the display manager, NOT gdm3.
sudo update-alternatives --config x-session-manager
echo .
echo "It is recommended to reboot after this."

echo "Installing Terminator..."
sleep 2
# Terminator
sudo apt install terminator

# Tidal-Hifi - Get latest build here:
# https://github.com/Mastermindzh/tidal-hifi/releases

echo "Cloning nmap-parse-output in ~/Github/nmap-parse-output and adding autocomplete to .zshrc"
echo "This will require you to spawn new terminals for autocomplete to work (or source it manually)"
# nmap-parse-output
# https://github.com/ernw/nmap-parse-output
git clone https://github.com/ernw/nmap-parse-output ~/Github/nmap-parse-output
echo 'autoload bashcompinit && bashcompinit && source ~/Github/nmap-parse-output/_nmap-parse-output' >> ~.zshrc

# see sources.list.d folder for apt sources for Google Chrome and VSCode.
echo "Adding custom sources in /etc/apt/sources.list.d"
echo " [+] Google-Chrome"
echo " [+] Visual Studio" 
sudo mkdir -p /etc/apt/sources.list.d
sudo cp -r sources.list.d/* /etc/apt/sources.list.d/. 

echo "##################"
echo "# Nvidia drivers #"
echo "##################"
echo .
echo "Make sure that Nvidia driver version 510 is the latest before continuing."
read -s -r -p "Press any key to keep going."
sleep 2

# These are the two that will contain all the required dependencies for hashcat to detect the GPU.
# Adjust driver version accordingly and hope for no errors :)
sudo apt install nvidia-tesla-510-driver nvidia-cuda-toolkit

echo "Setup done. Make sure to reboot. And run apt upgrade."
read -s -r -p "Press any key to exit."
