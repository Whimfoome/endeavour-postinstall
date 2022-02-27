#!/bin/bash

clear
echo -e "Initial Script"

echo -e "Remove some packages and hide some icons"
sudo pacman -Rs arc-gtk-theme-eos arc-x-icons-theme xterm
sudo mv /usr/share/applications/stoken-gui.desktop /usr/share/applications/stoken-gui.desktopbkup
sudo mv /usr/share/applications/stoken-gui-small.desktop /usr/share/applications/stoken-gui-small.desktopbkup
sudo mv /usr/share/applications/qv4l2.desktop /usr/share/applications/qv4l2.desktopbkup
sudo mv /usr/share/applications/qvidcap.desktop /usr/share/applications/qvidcap.desktopbkup
sudo mv /usr/share/applications/yad-icon-browser.desktop /usr/share/applications/yad-icon-browser.desktopbkup
sudo mv /usr/share/applications/avahi-discover.desktop /usr/share/applications/avahi-discover.desktopbkup

echo -e "Add flatpak"
sudo pacman -S --needed flatpak
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

echo -e "Install AppStore and Timeshift to handle backups"
yay -S --needed pamac-nosnap timeshift

echo -e "Enable Bluetooth"
sudo pacman -S --needed bluez bluez-utils
sudo systemctl enable --now bluetooth
