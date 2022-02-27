#!/bin/bash

clear

while true; do
    read -p "Do you wish to replace Firefox with Ungoogled Chromium? [y/n] " yn
    case $yn in
        [Yy]* ) break;;
        [Nn]* ) return;;
        * ) echo "Please answer yes or no.";;
    esac
done


flatpak install flathub com.github.Eloston.UngoogledChromium

echo -e "Adding Default Config"
# Turns off 'Clear cookies and site data when you quit Chromium'
# Turns on 'Send a "Do Not Track" request'
# Default Search engine - DuckDuckGo; to use Google, add this url "http://www.google.com/search?q=%s" to search engines
# Turns off 'Ask where to save each file before downloading'
# Downloads chromium-web-store to download extensions; in addition adds uBlock Origin and AutoScroll
mkdir -p ~/.var/app/com.github.Eloston.UngoogledChromium/config/chromium/
unzip ./configs/chromeprofile.zip -d ~/.var/app/com.github.Eloston.UngoogledChromium/config/chromium/

echo -e "Installing Widevine CDM"
source ./configs/widevine-install.sh

echo -e "Fixing the Spell Checker"
base64 -d ./configs/en-US-9-0.bdic > ~/.var/app/com.github.Eloston.UngoogledChromium/config/chromium/Dictionaries/en-US-9-0.bdic

echo -e "Forcing Dark Theme"
cp ./configs/chromium-flags.conf ~/.var/app/com.github.Eloston.UngoogledChromium/config/chromium-flags.conf


sudo pacman -Rs firefox
