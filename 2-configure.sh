#!/bin/bash

clear

echo -e "Hide some icons"
sudo mv /usr/share/applications/stoken-gui.desktop /usr/share/applications/stoken-gui.desktopbkup
sudo mv /usr/share/applications/stoken-gui-small.desktop /usr/share/applications/stoken-gui-small.desktopbkup
sudo mv /usr/share/applications/qv4l2.desktop /usr/share/applications/qv4l2.desktopbkup
sudo mv /usr/share/applications/qvidcap.desktop /usr/share/applications/qvidcap.desktopbkup
sudo mv /usr/share/applications/yad-icon-browser.desktop /usr/share/applications/yad-icon-browser.desktopbkup
sudo mv /usr/share/applications/avahi-discover.desktop /usr/share/applications/avahi-discover.desktopbkup

echo -e "Enable Bluetooth"
sudo systemctl enable --now bluetooth

source ./sub-betterfonts.sh

source ./sub-browser.sh


# Install Spotify Adblock
wget -q -c -nc -O ./spotify-adblock.so  https://github.com/abba23/spotify-adblock/releases/download/v1.0.1/spotify-adblock.so
wget -q -c -nc -O ./configs/spotify-config.toml  https://raw.githubusercontent.com/abba23/spotify-adblock/main/config.toml

mkdir -p ~/.spotify-adblock && cp ./spotify-adblock.so ~/.spotify-adblock/spotify-adblock.so
mkdir -p ~/.config/spotify-adblock && cp ./configs/spotify-config.toml ~/.config/spotify-adblock/config.toml

flatpak override --user --filesystem="~/.spotify-adblock/spotify-adblock.so" --filesystem="~/.config/spotify-adblock/config.toml" com.spotify.Client

cp ./configs/spotify-adblock.desktop ~/.local/share/applications

##
source ./sub-gnomede.sh

# Dotnet variables
echo -e "export PATH=\"\$PATH:~/.dotnet/tools\"" >> ~/.bashrc
echo -e "export DOTNET_CLI_TELEMETRY_OPTOUT=1" >> ~/.bashrc

# VSCode extensions
code --install-extension PKief.material-icon-theme
code --install-extension ms-dotnettools.csharp
code --install-extension rust-lang.rust
mkdir -p ~/.config/Code/User/ && cp ./configs/codesettings.json ~/.config/Code/User/settings.json

