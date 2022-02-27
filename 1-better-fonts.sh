#!/bin/bash

clear
# https://wiki.manjaro.org/index.php/Improve_Font_Rendering
echo -e "Install MSFonts & Improve Font Rendering"

yay -S ttf-ms-fonts ttf-tahoma ttf-vista-fonts
sudo cp ./configs/etcfontslocal.conf /etc/fonts/local.conf
cp ~/.Xresources ~/.Xresources.bak 
cp ./configs/xresources ~/.Xresources
xrdb -merge ~/.Xresources
sudo ln -s /usr/share/fontconfig/conf.avail/10-sub-pixel-rgb.conf /etc/fonts/conf.d/
sudo ln -s /usr/share/fontconfig/conf.avail/10-hinting-slight.conf /etc/fonts/conf.d/
sudo ln -s /usr/share/fontconfig/conf.avail/11-lcdfilter-default.conf /etc/fonts/conf.d/
sudo fc-cache -fv 

