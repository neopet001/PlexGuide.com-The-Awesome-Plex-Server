#!/bin/bash
#
# [PlexGuide Menu]
#
# GitHub:   https://github.com/Admin9705/PlexGuide.com-The-Awesome-Plex-Server
# Author:   Admin9705
# URL:      https://plexguide.com
#
# PlexGuide Copyright (C) 2018 PlexGuide.com
# Licensed under GNU General Public License v3.0 GPL-3 (in short)
#
#   You may copy, distribute and modify the software as long as you track
#   changes/dates in source files. Any modifications to our software
#   including (via compiler) GPL-licensed code must also be made available
#   under the GPL along with build & install instructions.
#
#################################################################################
echo "INFO - @Backup Solo Menu" > /var/plexguide/pg.log && bash /opt/plexguide/scripts/log.sh
export NCURSES_NO_UTF8_ACS=1

HEIGHT=19
WIDTH=30
CHOICE_HEIGHT=12
#BACKTITLE="Visit https://PlexGuide.com - Automations Made Simple"
TITLE="Backup Menu"
MENU="Choose a Program:"

OPTIONS=(1 "CouchPotato"
         2 "Deluge"
         3 "Emby"
         4 "Heimdall"
         5 "HTPCManager"
         6 "Jackett"
         7 "Lidarr"
         8 "MEDUSA"
         9 "Myler"
         10 "Muximux"
         11 "NZBGET"
         12 "NZBHydra"
         13 "NZBHydra2"
         14 "Ombi"
         15 "Organizr"
         16 "Plex"
         17 "Portainer"
         18 "Radarr"
         19 "Resilio"
         20 "Rutorrent"
         21 "SABNZBD"
         22 "SickRage"
         23 "Sonarr"
         24 "Tautulli"
         25 "Ubooquity"
         26 "Airsonic"
         27 "TorrentVPN"
         28 "qBittorrent"
         29 "Ombi4k"
         30 "Sonarr4k"
         31 "Radarr4k"
         Z "Exit")

CHOICE=$(dialog --clear \
                --title "$TITLE" \
                --menu "$MENU" \
                $HEIGHT $WIDTH $CHOICE_HEIGHT \
                "${OPTIONS[@]}" \
                2>&1 >/dev/tty)

clear
case $CHOICE in
        1)
            echo "couchpotato" > /tmp/program_var ;;
        2)
            echo "deluge" > /tmp/program_var ;;
        3)
            echo "embyserver" > /tmp/program_var ;;
        4)
            echo "heimdall" > /tmp/program_var ;;
        5)
            echo "htpcmanager" > /tmp/program_var ;;
        6)
            echo "jackett" > /tmp/program_var ;;
        7)
            echo "lidarr" > /tmp/program_var ;;
        8)
            echo "medusa" > /tmp/program_var ;;
        9)
            echo "myler" > /tmp/program_var ;;
        10)
            echo "muximux" > /tmp/program_var ;;
        11)
            echo "nzbget" > /tmp/program_var ;;
        12)
            echo "nzbhydra" > /tmp/program_var ;;
        13)
            echo "nzbhydra2" > /tmp/program_var ;;
        14)
            echo "ombiv3" > /tmp/program_var ;;
        15)
            echo "organizr" > /tmp/program_var ;;
        16)
            echo "plex" > /tmp/program_var ;;
        17)
            echo "portainer" > /tmp/program_var ;;
        18)
            echo "radarr" > /tmp/program_var ;;
        19)
            echo "resilio" > /tmp/program_var ;;
        20)
            echo "rutorrent" > /tmp/program_var ;;
        21)
            echo "sabnzbd" > /tmp/program_var ;;
        22)
            echo "sickrage" > /tmp/program_var ;;
        23)
            echo "sonarr" > /tmp/program_var ;;
        24)
            echo "tautulli" > /tmp/program_var ;;
        25)
            echo "ubooquity" > /tmp/program_var ;;
        26)
            echo "airsonic" > /tmp/program_var ;;
        27)
            echo "vpn" > /tmp/program_var ;;
        28)
            echo "qbittorrent" > /tmp/program_var ;;
        29)
            echo "ombi4k" > /tmp/program_var ;;
        30)
            echo "sonarr4k" > /tmp/program_var ;;
        31)
            echo "radarr4k" > /tmp/program_var ;;
        Z)
            echo "INFO - Exited Backup Menu" > /var/plexguide/pg.log && bash /opt/plexguide/scripts/log.sh
            clear
            exit 0 ;;

esac

app=$( cat /tmp/program_var )
echo "INFO - Backing Up $app" > /var/plexguide/pg.log && bash /opt/plexguide/scripts/log.sh

file="/opt/appdata/$app"
if [ -e "$file" ]
    then

        if dialog --stdout --title "Backup User Confirmation" \
            --backtitle "Visit https://PlexGuide.com - Automations Made Simple" \
            --yesno "\nDo you want to BACKOUT & EXIT from making the Backup -- $app -- ?" 0 0; then
            dialog --title "PG Backup Status" --msgbox "\nExiting! User selected to NOT Install!" 0 0
            sudo bash /opt/plexguide/menus/backup-restore/backup.sh
            exit 0
        else
            clear
        fi
    else
        dialog --title "PG Backup Status" --msgbox "\nExiting! You have no LOCAL data -- $app -- to backup to GDrive!" 0 0
        echo "WARNING - Backup: No Local Data to Backup for $app" > /var/plexguide/pg.log && bash /opt/plexguide/scripts/log.sh

        sudo bash /opt/plexguide/menus/backup-restore/backup.sh
        exit 0
fi

### Commenting Out Enables User To See What's Backing Up

app=$( cat /tmp/program_var )
if [ "$app" == "plex" ]
  then
    ### IF PLEX, execute this
    ansible-playbook /opt/plexguide/pg.yml --tags backup_normal,backup_plex #&>/dev/null &
else
    ### IF NOT PLEX, execute this
    ansible-playbook /opt/plexguide/pg.yml --tags backup_normal,backup_other
fi
    #echo "true" > /tmp/alive

    #loop="true"
    #echo "true" > /tmp/alive
    #while [ "$loop" = "true" ]
    #do
        #dialog --infobox "Backing Up / " 3 17
        #sleep 0.5
        #dialog --infobox "Backing Up | " 3 17
        #sleep 0.5
        #dialog --infobox "Backing Up \ " 3 17
        #sleep 0.5
        #dialog --infobox "Backing Up - " 3 17
        #sleep 0.5
        #loop=$(cat /tmp/alive) 1>/dev/null 2>&1
    #done

read -n 1 -s -r -p "Press any key to continue"

dialog --title "PG Backup Status" --msgbox "\nYour Backup of -- $app -- to Google Drive is Complete!" 0 0
echo "INFO - Backup $app Complete" > /var/plexguide/pg.log && bash /opt/plexguide/scripts/log.sh

exit 0
