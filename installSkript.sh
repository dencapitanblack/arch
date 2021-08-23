#!/bin/bash

#create a GUID Partition Table and section
fdisk /dev/sda << STDIO
g
n
1
2048
411647
n
2
411648
821247
t
2
4
n
4
9209856
14661631
n
5
14661632
16777182
n
3

9209855
w
STDIO

#formatting sections
mkfs -t ext2 -L Boot /dev/sda1
mkfs -t ext4 -L Root /dev/sda3
mkfs -t ext4 -L Home /dev/sda4
mkswap /dev/sda5

#mounting partitions
mount /dev/sda3 /mnt
mkdir /mnt/{boot,home}
mount /dev/sda1 /mnt/boot
mount /dev/sda4 /mnt/home
swapon /dev/sda5

#Installing basic packages
pacstrap /mnt base linux linux-firmware

#Creatin an FSTAB
genfstab -U /mnt >> /mnt/etc/fstab

#log in to the system
arch-chroot /mnt
echo "unmounted" 
ln -s /usr/share/zoneinfo/Europe/Moscow /etc/localtime
echo "unmounted"
hwclock --systohc --utc
echo "unmounted"
pacman -S nano
echo "unmounted"
