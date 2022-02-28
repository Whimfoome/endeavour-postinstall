#!/bin/bash

clear

install_spotify () {
  flatpak install flathub com.spotify.Client
  
  # Install Spotify Adblock
  wget -q -c -nc -O ./spotify-adblock.so  https://github.com/abba23/spotify-adblock/releases/download/v1.0.1/spotify-adblock.so
  wget -q -c -nc -O ./configs/spotify-config.toml  https://raw.githubusercontent.com/abba23/spotify-adblock/main/config.toml
  
  mkdir -p ~/.spotify-adblock && cp ./spotify-adblock.so ~/.spotify-adblock/spotify-adblock.so
  mkdir -p ~/.config/spotify-adblock && cp ./configs/spotify-config.toml ~/.config/spotify-adblock/config.toml
  
  flatpak override --user --filesystem="~/.spotify-adblock/spotify-adblock.so" --filesystem="~/.config/spotify-adblock/config.toml" com.spotify.Client
  
  cp ./configs/spotify-adblock.desktop ~/.local/share/applications
}

while true; do
    read -p "Do you want to install misc apps (Spotify+Adblock, etc.)? [y/n] " yn
    case $yn in
        [Yy]* ) install_spotify; break;;
        [Nn]* ) break;;
        * ) echo "Please answer yes or no.";;
    esac
done
