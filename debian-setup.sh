#!/bin/bash

cd ~

## add components to /etc/apt/sources.list
# add "contrib" and "nonfree"
sudo sh -c 'echo "deb http://deb.debian.org/debian/ bookworm main contrib non-free" > /etc/apt/sources.list'

## update the system
sudo apt update && sudo apt upgrade -y

## install packages
# packages from debian repos
sudo apt install bpytop cmatrix ghc gparted kitty lolcat neofetch nextcloud-desktop openconnect openscad qbittorrent retroarch texlive thunderbird vlc zsh -y

# instal vscode
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo install -o root -g root -m 644 microsoft.gpg /usr/share/keyrings/microsoft-archive-keyring.gpg
sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/usr/share/keyrings/microsoft-archive-keyring.gpg] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'

sudo apt install apt-transport-https -y
sudo apt update
sudo apt install code  -y

# installation of NvidiaGraphicDriver for Debian 12 Bookworm
sudo apt install nvidia-driver firmware-misc-nonfree -y

# install packagemanager nix
sudo sh <(curl -L https://nixos.org/nix/install) --daemon

## make zsh default shell
chsh -s /bin/zsh