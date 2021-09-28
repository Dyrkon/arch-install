#!/bin/bash

timedatectl set-ntp true

mkfs.vbat /dev/sda1

mkfs.ext4 /dev/sda2
#mkfs.btrfs /dev/sda2

mount /dev/sda2 /mnt
mkdir /mnt/boot
mount /dev/sda1 /mnt/boot

pacstrap /mnt base linux linux-firmware git vim nano intel-ucode

genfstab -U /mnt >> /mnt/etc/fstab

arch-chroot /mnt
