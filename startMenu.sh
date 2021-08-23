#!/bin/bash

pacman -Sy libnewt --noconfirm

function startMenu() {
    
    TOGSEL=$(whiptail --title "Menu" --fb --menu "Select option" 15 60 4 \
    "1" "Option" \
    "2" "Option" \
    "3" "Option" 3>&1 1>&2 2>&3)  
    
    case $TOGSEL in
    
    1)
      echo "Option 1"
      whiptail --title "Option 1" --msgbox "you choose options 1" 8 45
      
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
