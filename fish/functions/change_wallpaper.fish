#!/usr/bin/fish

function change_wallpaper -d "Change the wallpaper and set the hyprpaper conf"

    begin
        # Avoid piling up memory
        command hyprctl hyprpaper unload all

        # Do the change
        command hyprctl hyprpaper preload "$argv"
        command hyprctl hyprpaper wallpaper "HDMI-A-1,$argv"
    end &> /dev/null

    # Change config file to have wallpaper on startup
    if test $status = 0
        echo >~/.config/hypr/hyprpaper.conf "\
preload = $argv
wallpaper = HDMI-A-1,$argv"
    else
        echo "Some error occured"
    end
end
