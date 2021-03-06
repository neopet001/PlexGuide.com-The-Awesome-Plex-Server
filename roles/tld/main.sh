#!/bin/bash
#
# [PlexGuide Menu]
#
# GitHub:   https://github.com/Admin9705/PlexGuide.com-The-Awesome-Plex-Server
# Author:   Admin9705 - Deiteq
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
export NCURSES_NO_UTF8_ACS=1
echo 'INFO - @Top Level Domain Selection Menu' > /var/plexguide/pg.log && bash /opt/plexguide/scripts/log.sh

HEIGHT=13
WIDTH=38
CHOICE_HEIGHT=7
BACKTITLE="Visit PlexGuide.com - Automations Made Simple"
TITLE="App Selection for Primary Domain"

 OPTIONS=(A "Heimdall"
          B "HTPCManager"
          C "Muximux"
          D "Ombi"
          E "Organizr"
          F "Tautulli"
          Z "Exit")

CHOICE=$(dialog --backtitle "$BACKTITLE" \
                --title "$TITLE" \
                --menu "$MENU" \
                $HEIGHT $WIDTH $CHOICE_HEIGHT \
                "${OPTIONS[@]}" \
                2>&1 >/dev/tty)

case $CHOICE in
        A)         
            program="heimdall"
            echo "$program" > /var/plexguide/tld.choice
            bash /opt/plexguide/roles/tld/rebuild.sh
            ;;
        B)
            program="htpcmanager"
            echo "$program" > /var/plexguide/tld.choice
            bash /opt/plexguide/roles/tld/rebuild.sh
            ;;
        C)
            program="muximux"
            echo "$program" > /var/plexguide/tld.choice
            bash /opt/plexguide/roles/tld/rebuild.sh
            ;;
        D)
            program="ombi"
            echo "$program" > /var/plexguide/tld.choice
            bash /opt/plexguide/roles/tld/rebuild.sh
            ;;
        E)
            program="organizr"
            echo "$program" > /var/plexguide/tld.choice
            bash /opt/plexguide/roles/tld/rebuild.sh
            ;;
        F)
            program="tautulli"
            echo "$program" > /var/plexguide/tld.choice
            bash /opt/plexguide/roles/tld/rebuild.sh
            ;;
        Z)
            exit 0 ;;
esac
echo 'INFO - Selected $program for Top Level Domain' > /var/plexguide/pg.log && bash /opt/plexguide/scripts/log.sh

#recall itself to loop unless user exits
bash /opt/plexguide/roles/tld/main.sh
