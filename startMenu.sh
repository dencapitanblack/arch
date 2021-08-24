#!/bin/bash

pacman -Sy libnewt --noconfirm

function startMenu() {

    TOGSEL=$(whiptail --title "Menu" --fb --menu "Select option" 15 60 4 \
    "1" "Create GPT and and creating sections" \
    "2" "Option" \
    "3" "Option" 3>&1 1>&2 2>&3)

    case $TOGSEL in

    1)
      echo "Create GPT and and creating sections"
      chmod ugo+rwx gptWithSection.sh
      ./gptWithSection.sh 2>> std-err.log 1>> std-out.log
      startMenu
      ;;

    2)
      echo "Option 2"
      chmod ugo+rwx formMount.sh
      ./formMount.sh 2>> std-err.log 1>> std-out.log
      startMenu
      ;;

    3)
      echo "Option 3"
      arch-chroot /mnt
      
      ;;

    esac

}

startMenu
