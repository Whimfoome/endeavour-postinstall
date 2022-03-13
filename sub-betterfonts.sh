#!/bin/bash

# https://wiki.manjaro.org/index.php/Improve_Font_Rendering
echo -e "Improve Font Rendering"

sudo cp ./configs/etcfontslocal.conf /etc/fonts/local.conf
cp ~/.Xresources ~/.Xresources.bak 
cp ./configs/xresources ~/.Xresources
xrdb -merge ~/.Xresources
sudo ln -s /usr/share/fontconfig/conf.avail/10-sub-pixel-rgb.conf /etc/fonts/conf.d/
sudo ln -s /usr/share/fontconfig/conf.avail/10-hinting-slight.conf /etc/fonts/conf.d/
sudo ln -s /usr/share/fontconfig/conf.avail/11-lcdfilter-default.conf /etc/fonts/conf.d/

echo -e "Install JetBrains Mono"
wget -q -c -nc -O ./jetbrainsmono.zip https://download.jetbrains.com/fonts/JetBrainsMono-2.242.zip
mkdir -p ~/.local/share/fonts/jetbrains
unzip ./jetbrainsmono.zip -d ~/.local/share/fonts/jetbrains

sudo fc-cache -fv 

