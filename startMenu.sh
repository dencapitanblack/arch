#!/bin/bash

pacman -Sy libnewt --noconfirm

function startMenu() {

    TOGSEL=$(whiptail --title "Menu" --fb --menu "Select option" 15 60 4 \
    "1" "Create GPT and creating sections" \
    "2" "Mounting partition and install base linux packs" \
    "3" "Enter to arch-chroot" \
    "4" "Option" 3>&1 1>&2 2>&3)

    case $TOGSEL in

    1)
      echo "Create GPT and and creating sections"
      chmod ugo+rwx gptWithSection.sh
      ./gptWithSection.sh 2>> std-err.log 1>> std-out.log
      startMenu
      
      ;;

    2)
      echo "Mounting partition and install base linux packs"
      chmod ugo+rwx formMount.sh
      ./formMount.sh 2>> std-err.log 1>> std-out.log
      startMenu
      
      ;;

    3)
      echo "Enter to arch-chroot"
      arch-chroot /mnt
      startMenu
      
      ;;
      
    4)
      echo "Welcome to Bash $BASH_VERSION" > test_textbox
      whiptail --textbox test_textbox 12 80
      startMenu
      ;;
      
      
    esac

}

startMenu
