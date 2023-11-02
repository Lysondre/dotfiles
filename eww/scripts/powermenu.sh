
tmpPath="$HOME/.cache/eww/powermenu"

if [ "$1" == "--reboot" ]; then
    rm $tmpPath
    systemctl reboot
elif [ "$1" == "--shutdown" ]; then
    rm $tmpPath
    systemctl poweroff
fi
