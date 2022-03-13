#!/bin/bash

pac_to_install="flatpak gnome-backgrounds bluez bluez-utils ninja git meson sassc gamemode lib32-gamemode dotnet-sdk git-lfs"

yay_to_install="pamac-nosnap timeshift ttf-ms-fonts ttf-tahoma ttf-vista-fonts visual-studio-code-bin"

flat_to_install="com.github.tchx84.Flatseal de.haeckerfelix.Fragments io.github.celluloid_player.Celluloid org.gnome.TextEditor com.mattjakeman.ExtensionManager org.gnome.Calculator org.gnome.FileRoller com.github.Eloston.UngoogledChromium com.spotify.Client org.libreoffice.LibreOffice com.usebottles.bottles io.github.shiftey.Desktop org.blender.Blender org.gimp.GIMP org.gimp.GIMP.Plugin.GMic com.valvesoftware.Steam com.heroicgameslauncher.hgl"

pac_to_remove="arc-gtk-theme-eos arc-x-icons-theme xterm totem gedit gnome-calculator gnome-screenshot file-roller firefox"



echo -e "Update Systen"
sudo pacman -Syu

source ./sub-gamingdriver.sh

clear
sudo pacman -S --needed $pac_to_install
clear
yay -S --needed $yay_to_install

clear
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

clear
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
flatpak install flathub $flat_to_install

clear
sudo pacman -Rs $pac_to_remove
sudo pacman -Rns $(pacman -Qdtq)
