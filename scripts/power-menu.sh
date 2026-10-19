
#!/usr/bin/env bash

choice=$(printf "󰤄  Mise en veille\n󰜉  Redémarrer\n󰐥  Éteindre\n" |
    rofi -dmenu -i -p "Alimentation")

case "$choice" in
    *"Mise en veille"*)
        systemctl suspend
        ;;
    *"Redémarrer"*)
        systemctl reboot
        ;;
    *"Éteindre"*)
        systemctl poweroff
        ;;
esac
