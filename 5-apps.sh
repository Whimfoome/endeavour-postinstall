#!/bin/bash

clear

install_misc_apps () {
  sudo pacman -S --needed steam
  yay -S --needed heroic-games-launcher-bin
  flatpak install flathub com.spotify.Client org.libreoffice.LibreOffice com.usebottles.bottles
  
  # Install Spotify Adblock
  wget -q -c -nc -O ./spotify-adblock.so  https://github.com/abba23/spotify-adblock/releases/download/v1.0.1/spotify-adblock.so
  wget -q -c -nc -O ./configs/spotify-config.toml  https://raw.githubusercontent.com/abba23/spotify-adblock/main/config.toml
  
  mkdir -p ~/.spotify-adblock && cp ./spotify-adblock.so ~/.spotify-adblock/spotify-adblock.so
  mkdir -p ~/.config/spotify-adblock && cp ./configs/spotify-config.toml ~/.config/spotify-adblock/config.toml
  
  flatpak override --user --filesystem="~/.spotify-adblock/spotify-adblock.so" --filesystem="~/.config/spotify-adblock/config.toml" com.spotify.Client
  
  cp ./configs/spotify-adblock.desktop ~/.local/share/applications
}

while true; do
    read -p "Do you want to install misc apps (Spotify+Adblock, LibreOffice, Steam, Heroic, Bottles)? [y/n] " yn
    case $yn in
        [Yy]* ) install_misc_apps; break;;
        [Nn]* ) break;;
        * ) echo "Please answer yes or no.";;
    esac
done

clear

install_dev_tools () {
  # Install GitHub Desktop, Blender, GIMP + GMIC
  flatpak install flathub io.github.shiftey.Desktop org.blender.Blender org.gimp.GIMP org.gimp.GIMP.Plugin.GMic
  clear # Install DotNet, git-lfs
  sudo pacman -S --needed dotnet-sdk git-lfs
  clear # Install VSCode
  yay -S --needed visual-studio-code-bin
  clear # Install Rust
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
  
  echo -e "export PATH=\"\$PATH:~/.dotnet/tools\"" >> ~/.bashrc
  echo -e "export DOTNET_CLI_TELEMETRY_OPTOUT=1" >> ~/.bashrc
  
  code --install-extension PKief.material-icon-theme
  code --install-extension ms-dotnettools.csharp
  code --install-extension rust-lang.rust
  mkdir -p ~/.config/Code/User/ && cp ./configs/codesettings.json ~/.config/Code/User/settings.json
}

while true; do
    read -p "Do you want to install Development Tools? [y/n] " yn
    case $yn in
        [Yy]* ) install_dev_tools; break;;
        [Nn]* ) break;;
        * ) echo "Please answer yes or no.";;
    esac
done
