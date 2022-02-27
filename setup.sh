#!/bin/bash

echo -e "Update Systen"
sudo pacman -Syu

source ./0-initial.sh
source ./1-better-fonts.sh
source ./2-gnome-de.sh
source ./3-gamingdriver.sh

clear
echo -e "Uninstall Unneeded packages"
sudo pacman -Rns $(pacman -Qdtq)

