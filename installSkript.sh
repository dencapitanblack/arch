#!/bin/bash

#create a GUID Partition Table
fdisk /dev/sda << STDIO
g
w
STDIO

#creating sections
fdisk /dev/sda << STDIO
n
1
2048
411647
w
STDIO

fdisk /dev/sda << STDIO
n
2
411648
821247
t
2
4
w
STDIO

fdisk /dev/sda << STDIO
n
4
9209856
14661631
w
STDIO

fdisk /dev/sda << STDIO
n
5
14661632
16777182
w
STDIO

fdisk /dev/sda << STDIO
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
mount /dev/sda3/ /mnt
mkdir /mnt/{boot,home}
mount /dev/sda1 /mnt/boot
mount /dev/sda4 /mnt/home
swapon /dev/sda5

#Installing basic packages
pacstrap /mnt base linux linux-firmware

#Creatin an FSTAB
genfstab -U /mnt >> /mnt/etc/fstab
