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
