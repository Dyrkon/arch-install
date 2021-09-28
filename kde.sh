#!/bin/bash

sudo timedatectl set-ntp true
sudo hwclock --systohc

sudo reflector -c Czechia -a 6 --sort rate --save /etc/pacman.d/mirrorlist

sudo firewall-cmd --add-port=1025-65535/tcp --permanent
sudo firewall-cmd --add-port=1025-65535/udp --permanent
sudo firewall-cmd --reload

pacman -S plasma kde-applications plasma-wayland-session xorg-xwayland xorg mesa wayland sddm gt5-wayland

sudo systemctl enable sddm

echo "done"
