#!/bin/bash
# https://github.com/lutris/docs/blob/master/InstallingDrivers.md for more info

clear
echo -e "Installing Gaming Drivers - GamemodeRun"

sudo pacman -S --needed gamemode lib32-gamemode

clear
echo -e "Installing Gaming Drivers - Vulkan"
echo -e "NVIDIA - Warning: Please ensure your graphics card is supported by modern NVIDIA driver before installing. Proprietary driver and support for Vulkan are required\n"
echo -e "AMD - Functional only if you have a Vulkan capable GPU\n"
echo -e "Intel - Functional only if you have a Vulkan capable GPU\n"
echo -e "-----\n"

PS3='Select GPU drivers (number only): '
options=("NVIDIA" "AMD" "Intel" "Nothing")
select opt in "${options[@]}"
do
    case $opt in
        "NVIDIA")
            echo "You chose NVIDIA"
            sudo pacman -S --needed nvidia-dkms nvidia-utils lib32-nvidia-utils nvidia-settings vulkan-icd-loader lib32-vulkan-icd-loader
            break
            ;;
        "AMD")
            echo "You chose AMD"
            sudo pacman -S --needed lib32-mesa vulkan-radeon lib32-vulkan-radeon vulkan-icd-loader lib32-vulkan-icd-loader
            break
            ;;
        "Intel")
            echo "You chose Intel"
            sudo pacman -S --needed lib32-mesa vulkan-intel lib32-vulkan-intel vulkan-icd-loader lib32-vulkan-icd-loader
            break
            ;;
        "Nothing")
            break
            ;;
        *) echo "Invalid option $REPLY";;
    esac
done

