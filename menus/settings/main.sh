#!/bin/bash
#
# [PlexGuide Menu]
#
# GitHub:   https://github.com/Admin9705/PlexGuide.com-The-Awesome-Plex-Server
# Author:   Admin9705 & Deiteq
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
echo 'INFO - @Settings Menu - GDrive Edition' > /var/plexguide/pg.log && bash /opt/plexguide/scripts/log.sh
HEIGHT=17
WIDTH=59
CHOICE_HEIGHT=10
BACKTITLE="Visit https://PlexGuide.com - Automations Made Simple"
TITLE="PG Settings"
MENU="Make Your Selection Choice:"

OPTIONS=(A "Domain/Traefik: Setup/Change Domain & Trefik"
         B "Hard Drive 2nd: Use a Second HD for Processing"
         C "Processor     : Enhance Processing Power"
         D "Kernel Mods   : Enhance Network Throughput"
         E "WatchTower    : Auto-Update Application Manager"
         F "Import Media  : Import Existing Media to GDrive"
         G "Change Time   : Change the Server Time"
         H "Domain App    : For Your Top Level Domain"
         I "Server ID     : Change Default Server ID"
         Z "Exit")

CHOICE=$(dialog --clear \
                --backtitle "$BACKTITLE" \
                --title "$TITLE" \
                --menu "$MENU" \
                $HEIGHT $WIDTH $CHOICE_HEIGHT \
                "${OPTIONS[@]}" \
                2>&1 >/dev/tty)

clear
case $CHOICE in
    A)
echo 'INFO - Selected: Domain/Traefik Menus' > /var/plexguide/pg.log && bash /opt/plexguide/scripts/log.sh
        bash /opt/plexguide/menus/traefik/main.sh
        ;;
    B)
echo 'INFO - Selected: 2nd HD Interface' > /var/plexguide/pg.log && bash /opt/plexguide/scripts/log.sh
        bash /opt/plexguide/scripts/baseinstall/harddrive.sh ;;
    C)
echo 'INFO - Selected: Enhance Processor' > /var/plexguide/pg.log && bash /opt/plexguide/scripts/log.sh
        bash /opt/plexguide/scripts/menus/processor/processor-menu.sh ;;
    D)
echo 'INFO - Selected: Kernal Mods' > /var/plexguide/pg.log && bash /opt/plexguide/scripts/log.sh
        bash /opt/plexguide/scripts/menus/kernel-mod-menu.sh ;;
    E)
echo 'INFO - Selected: WatchTower Interface' > /var/plexguide/pg.log && bash /opt/plexguide/scripts/log.sh
        bash /opt/plexguide/roles/watchtower/menus/main.sh
        ;;
    F)
echo 'INFO - Selected: 2nd HD Interface' > /var/plexguide/pg.log && bash /opt/plexguide/scripts/log.sh
        bash /opt/plexguide/menus/migrate/main.sh ;;
    G)
echo 'INFO - Selected: Import Media' > /var/plexguide/pg.log && bash /opt/plexguide/scripts/log.sh
        dpkg-reconfigure tzdata ;;
    H)
echo 'INFO - Selected: 2nd HD Interface' > /var/plexguide/pg.log && bash /opt/plexguide/scripts/log.sh
        bash /opt/plexguide/roles/tld/main.sh ;;
    I)
echo 'INFO - Selected: Change Server ID' > /var/plexguide/pg.log && bash /opt/plexguide/scripts/log.sh
        bash /opt/plexguide/menus/backup-restore/server.sh ;;
    Z)
        clear
        exit 0
        ;;
    esac
clear

bash /opt/plexguide/menus/settings/main.sh
exit 0
