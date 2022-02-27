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

# Settings
## Turn off Clear cookies and site data when you quit Chromium
## Turn on Send a "Do Not Track" request with your browsing traffic
## Default Search engine - DuckDuckGo 
### You can add Google as a search engine via this URL in Manage search engines - "http://www.google.com/search?q=%s"
## Turn off Ask where to save each file before downloading

# Download chromium-web-store (https://github.com/NeverDecaf/chromium-web-store)
## Change the flag `chrome://flags/#extension-mime-request-handling` to `Always prompt` for install.
## Get uBlock Origin
## Get AutoScroll
## Get LocalCDN

# Flatpak Optional (https://github.com/flathub/com.github.Eloston.UngoogledChromium)
## Install Widevine CDM
## Fix the Spell Checker
## How to Force Enable Dark Theme

# NO IDEA HOW TO IMPLEMENT THESE, I CAN'T FIND ANY API/CLI COMMANDS/CONFIG FILES... :(

sudo pacman -Rs firefox
