#!/bin/bash

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

# Adwaita for GTK3
git clone https://github.com/lassekongo83/adw-gtk3.git
cd adw-gtk3
meson build
sudo ninja -C build install
cd ../

dconf write /org/gnome/desktop/interface/gtk-theme "'adw-gtk3-dark'"

dconf write /org/gnome/desktop/interface/color-scheme "'prefer-dark'"
dconf write /org/gnome/desktop/wm/preferences/button-layout "'appmenu:minimize,close'"
echo -e "Enabled Dark Theme"


# Organize App Picker Layout, Favorite Apps, Folders
#dconf write /org/gnome/shell/favorite-apps "'\'org.gnome.Terminal.desktop\', \'org.gnome.Nautilus.desktop\', \'com.github.Eloston.UngoogledChromium.desktop\']'"

#dconf write /org/gnome/desktop/app-folders/folder-children "'[\'c1cbcba0-aa08-4b07-9b12-61a1afd89647\', \'665fe026-67d2-4a34-928e-6eaada901f13\', \'a56a3a33-922c-41ad-9858-08638fcabf40\', \'9210961c-b2a4-43cf-96d7-5a2d5937e6dc\', \'963ade7b-3d4e-4858-805e-ca0fd0ff1715\', \'fe5f3960-4d41-4d2f-ac41-1b01b2c155da\']'"

#dconf write /org/gnome/desktop/app-folders/folders/665fe026-67d2-4a34-928e-6eaada901f13/apps "'[\'org.gnome.Extensions.desktop\', \'org.gnome.tweaks.desktop\', \'com.mattjakeman.ExtensionManager.desktop\']'"
#dconf write /org/gnome/desktop/app-folders/folders/665fe026-67d2-4a34-928e-6eaada901f13/name "'Extensions'"

#dconf write /org/gnome/desktop/app-folders/folders/9210961c-b2a4-43cf-96d7-5a2d5937e6dc/apps "'[\'welcome.desktop\', \'UpdateInTerminal.desktop\', \'reflector-simple.desktop\', \'eos-apps-info.desktop\', \'eos-log-tool.desktop\', \'eos-update-notifier-configure.desktop\']'"
#dconf write /org/gnome/desktop/app-folders/folders/9210961c-b2a4-43cf-96d7-5a2d5937e6dc/name "'Endeavour'"

#dconf write /org/gnome/desktop/app-folders/folders/963ade7b-3d4e-4858-805e-ca0fd0ff1715/apps "'[\'pavucontrol.desktop\', \'org.gnome.PowerStats.desktop\', \'org.gnome.meld.desktop\', \'yad-settings.desktop\']'"
#dconf write /org/gnome/desktop/app-folders/folders/963ade7b-3d4e-4858-805e-ca0fd0ff1715/name "'Misc'"

#dconf write /org/gnome/desktop/app-folders/folders/a56a3a33-922c-41ad-9858-08638fcabf40/apps "'[\'bssh.desktop\', \'bvnc.desktop\', \'nm-connection-editor.desktop\', \'gnome-nettool.desktop\']'"
#dconf write /org/gnome/desktop/app-folders/folders/a56a3a33-922c-41ad-9858-08638fcabf40/name "'Network'"

#dconf write /org/gnome/desktop/app-folders/folders/c1cbcba0-aa08-4b07-9b12-61a1afd89647/apps "'[\'org.libreoffice.LibreOffice.desktop\', \'org.libreoffice.LibreOffice.writer.desktop\', \'org.libreoffice.LibreOffice.calc.desktop\', \'org.libreoffice.LibreOffice.impress.desktop\', \'org.libreoffice.LibreOffice.draw.desktop\', \'org.libreoffice.LibreOffice.base.desktop\', \'org.libreoffice.LibreOffice.math.desktop\']'"
#dconf write /org/gnome/desktop/app-folders/folders/c1cbcba0-aa08-4b07-9b12-61a1afd89647/name "'Office'"

#dconf write /org/gnome/desktop/app-folders/folders/fe5f3960-4d41-4d2f-ac41-1b01b2c155da/apps "'[\'com.valvesoftware.Steam.desktop\', \'com.heroicgameslauncher.hgl.desktop\', \'com.usebottles.bottles.desktop\''"
#dconf write /org/gnome/desktop/app-folders/folders/fe5f3960-4d41-4d2f-ac41-1b01b2c155da/name "'Games'"

#dconf write /org/gnome/shell/app-picker-layout "'[{\'9210961c-b2a4-43cf-96d7-5a2d5937e6dc\': <{\'position\': <0>}>, \'org.manjaro.pamac.manager.desktop\': <{\'position\': <1>}>, \'timeshift-gtk.desktop\': <{\'position\': <2>}>, \'gnome-control-center.desktop\': <{\'position\': <3>}>, \'com.github.tchx84.Flatseal.desktop\': <{\'position\': <4>}>, \'c1cbcba0-aa08-4b07-9b12-61a1afd89647\': <{\'position\': <5>}>, \'org.gnome.Usage.desktop\': <{\'position\': <6>}>, \'de.haeckerfelix.Fragments.desktop\': <{\'position\': <7>}>, \'org.gnome.TextEditor.desktop\': <{\'position\': <8>}>, \'org.gnome.Calculator.desktop\': <{\'position\': <9>}>, \'io.github.shiftey.Desktop.desktop\': <{\'position\': <10>}>, \'visual-studio-code.desktop\': <{\'position\': <11>}>, \'org.gimp.GIMP.desktop\': <{\'position\': <12>}>, \'org.blender.Blender.desktop\': <{\'position\': <13>}>, \'spotify-adblock.desktop\': <{\'position\': <14>}>, \'fe5f3960-4d41-4d2f-ac41-1b01b2c155da\': <{\'position\': <15>}>}, {\'665fe026-67d2-4a34-928e-6eaada901f13\': <{\'position\': <0>}>, \'a56a3a33-922c-41ad-9858-08638fcabf40\': <{\'position\': <1>}>, \'963ade7b-3d4e-4858-805e-ca0fd0ff1715\': <{\'position\': <2>}>, \'org.gnome.DiskUtility.desktop\': <{\'position\': <3>}>, \'io.github.celluloid_player.Celluloid.desktop\': <{\'position\': <4>}>, \'org.gnome.eog.desktop\': <{\'position\': <5>}>, \'org.gnome.FileRoller.desktop\': <{\'position\': <6>}>, \'org.gnome.Evince.desktop\': <{\'position\': <7>}>, \'com.spotify.Client.desktop\': <{\'position\': <8>}>}>}]'"
