#!/bin/bash

# Add US and Bulgarian Traditional Phonetic Keyboard Layout
dconf write /org/gnome/desktop/input-sources/sources "[('xkb', 'us'), ('xkb', 'bg+phonetic')]"

# Enable Keyboard LED
# Wayland
sudo pacman -Syu brightnessctl

scrollport=$(brightnessctl --list | grep -F scrolllock)
clear
echo -e "Type the output in the quotes below. Example: input3::scrolllock"
echo -e $scrollport
read devicestring

clear
echo -e "Add this as shortcut:"
echo -e "brightnessctl --device='$devicestring' set 1"

# Xorg: xset led named "Scroll Lock"
