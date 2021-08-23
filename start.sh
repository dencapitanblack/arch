!#/bin/bash
pacman -S dialog --noconfirm
tempfile="$(mktemp)"
while true; do
    dialog --menu 'Please take a selection' 18 70 15 $(n1 

