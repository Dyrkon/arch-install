#!/bin/bash

ln -sf /usr/share/zoneinfo/Europe/Prague /etc/localtime

hwclock --systohc

locale-gen

echo "LANG=en_US.UTF-8" >> /etc/locale.conf

echo "arch" >> /etc/hostname

echo "127.0.0.1	localhost" >> /etc/hosts
echo "::1" >> /etc/hosts
echo "127.0.1.1	arch.localdomain	arch" >> /etc/hostis

echo root:linux | chpasswd

pacman -S grub grub-btrfs efibootmgr networkmanager network-manager-applet dialog wpa_supplicant mtools dosfstools reflector base-devel linux-headers avahi xdg-user-dirs xdg-utils gvfs gvfs-smb nfs-utils inetutils dnsutils bluez bluez-utils cups hplip alsa-utils pipewire pipewire-alsa pipewire-pulse pipewire-jack openssh rsync reflector acpi acpi_call tlp virt-manager qemu qemu-arch-extra edk2-ovmf bridge-utils dnsmasq vde2 openbsd-netcat iptables-nft ipset firewall sof-firmware nss-mdns acpid os-prober ntfs-3g terminus-font

pacman -S nvidia nvidia-utils nvidia-settings

grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=GRUB
grub-mkconfig -o /boot/grub/grub.cfg

systemctl enable NetworkManager
systemctl enable bluetooth
systemctl enable cups.service
systemctl enable sshd
systemctl enable avahi-daemon
systemctl enable reflector.timer
systemctl enable fstrim.timer
systemctl enable libvirtd
systemctl enable firewalld
systemctl enable acpid

echo "Do manualy..."
echo "passwd\nuseradd -mG wheel dyrkon\nEDITOR=vim visudo\npasswd dyrkon"

echo "umount -a and reboot"

