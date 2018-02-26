#!/bin/bash

  ## point to variable file for ipv4 and domain.com
  source <(grep '^ .*='  /opt/appdata/plexguide/var.sh)
  echo $ipv4
  echo $domain

source <(grep '^ .*='  /opt/appdata/plexguide/var.sh)
echo $ipv4
echo $domain

HEIGHT=10
WIDTH=38
CHOICE_HEIGHT=5
BACKTITLE="Visit PlexGuide.com - Automations Made Simple"
TITLE="NZB Applications - Media Programs"

OPTIONS=(A "Plex"
         B "Emby"
         C "Ubooquity"
         Z "Exit")

CHOICE=$(dialog --backtitle "$BACKTITLE" \
                --title "$TITLE" \
                --menu "$MENU" \
                $HEIGHT $WIDTH $CHOICE_HEIGHT \
                "${OPTIONS[@]}" \
                2>&1 >/dev/tty)

case $CHOICE in
        A)
            clear
            program=Portainer
            port=19999
            bash /opt/plexguide/ansible/menus/plex.main.sh
        B)
            clear
            program=Traefik
            port=NONE
            ansible-playbook /opt/plexguide/ansible/plexguide.yml --tags emby ;;
        C)
            clear
            program=Ubooquity
            port=2202
            ansible-playbook /opt/plexguide/ansible/plexguide.yml --tags ubooquity ;;

        Z)
            exit 0 ;;
esac

    clear

    dialog --title "$program - Address Info" \
    --msgbox "\nIPv4      - http://$ipv4:$port\nSubdomain - https://$program.$domain\nDomain    - http://$domain:$port" 8 50

#### recall itself to loop unless user exits
bash /opt/plexguide/menus/programs/media.sh
