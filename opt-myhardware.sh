#!/bin/bash

# Colors
COL_CYAN='\033[0;36m'
COL_NO='\033[0m'

# Add US and Bulgarian Traditional Phonetic Keyboard Layout
dconf write /org/gnome/desktop/input-sources/sources "[('xkb', 'us'), ('xkb', 'bg+phonetic')]"

# Enable Keyboard LED
# Xorg: xset led named "Scroll Lock"
# Wayland
sudo pacman -Syu --needed brightnessctl

scrollport=$(brightnessctl --list | grep -F scrolllock)
clear
echo -e "Type the output in the quotes below. Example: ${COL_CYAN}input3::scrolllock${COL_NO}"
echo -e $scrollport
read devicestring

clear
echo -e "Add this as shortcut:"
echo -e "${COL_CYAN}brightnessctl --device='$devicestring' set 1${COL_NO}"

read -p "Press [Enter] when ready..."


# AMD R9 280X/380 fix
clear
echo -e "AMD R9 280X/380 fix:"
echo -e "Type '${COL_CYAN}sudo nano /etc/default/grub${COL_NO}' in another terminal"
echo -e "Add '${COL_CYAN}radeon.cik_support=0 radeon.si_support=0 amdgpu.cik_support=1 amdgpu.si_support=1${COL_NO}' to 'GRUB_CMDLINE_LINUX_DEFAULT'"
read -p "Press [Enter] when ready..."
sudo grub-mkconfig -o /boot/grub/grub.cfg
