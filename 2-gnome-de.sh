#!/bin/bash

clear
echo -e "Configuring GNOME Desktop Environment"
# Enable Night Light
dconf write /org/gnome/settings-daemon/plugins/color/night-light-enabled true
dconf write /org/gnome/settings-daemon/plugins/color/night-light-schedule-automatic true
dconf write /org/gnome/settings-daemon/plugins/color/night-light-temperature 4160
echo -e "Enabled Night Light"

# Privacy/File Cache/Screen Lock
echo -e "Privacy: "
dconf write /org/gnome/desktop/privacy/recent-files-max-age 7
dconf write /org/gnome/desktop/privacy/remove-old-trash-files true
dconf write /org/gnome/desktop/privacy/remove-old-temp-files true
dconf write /org/gnome/desktop/privacy/old-files-age 7
echo -e "Delete file history, trash and temp files every 7 days."

dconf write /org/gnome/desktop/session/idle-delay 600
dconf write /org/gnome/desktop/screensaver/lock-delay 300
dconf write /org/gnome/settings-daemon/plugins/power/power-button-action "'interactive'"
echo -e "Screen Blank - 10 min, Lock Screen - +5 min after blank. Power button shuts down the computer."

# App settings
dconf write /org/gtk/settings/file-chooser/sort-directories-first true
dconf write /org/gnome/nautilus/list-view/use-tree-view true
dconf write /org/gnome/nautilus/preferences/show-create-link true
dconf write /org/gnome/nautilus/preferences/show-delete-permanently true
echo -e "Files - Sort Folders before Files; Expandable folders in List View; Context Menu - Create Link, Delete Permanently."

# Do Not Disturb
dconf write /org/gnome/desktop/notifications/show-banners false
echo -e "Do Not Disturb Enabled"

# Dark Theme
build_adwgtk3 () {
  sudo pacman -S --needed ninja git meson sassc
  git clone https://github.com/lassekongo83/adw-gtk3.git
  cd adw-gtk3
  meson build
  sudo ninja -C build install
  cd ../
  
  dconf write /org/gnome/desktop/interface/gtk-theme "'adw-gtk3-dark'"
}

echo -e "\n\n"
while true; do
    read -p "Do you wish to make gtk3 apps look like gtk4 libadwaita? [y/n] " yn
    case $yn in
        [Yy]* ) build_adwgtk3; break;;
        [Nn]* ) dconf write /org/gnome/desktop/interface/gtk-theme "'Adwaita-dark'"; break;;
        * ) echo "Please answer yes or no.";;
    esac
done

dconf write /org/gnome/desktop/interface/color-scheme "'prefer-dark'"
dconf write /org/gnome/desktop/wm/preferences/button-layout "'appmenu:minimize,close'"
echo -e "Enabled Dark Theme"

