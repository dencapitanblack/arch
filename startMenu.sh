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
      ./gptWithSection.sh

      ;;

    2)
      echo "Option 2"
      whiptail --title "Option 2" --msgbox "you chose options 2" 8 45

      ;;

    3)
      echo "Option 3"
      whiptail --title "Option 3" --msgbox "you chose options 3" 8 45

      ;;

    esac

}

startMenu
