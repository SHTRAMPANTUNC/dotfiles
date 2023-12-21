#!/usr/bin/env bash

uptime=$(uptime -p | sed -e 's/up //g')
dir="~/.config/rofi/"
rofi_command="rofi -theme $dir/power.rasi"

# Options
shutdown="󰐥"
reboot="󰜉"
suspend="󰤄"
lock=""
logout=""

options="$shutdown\n$reboot\n$suspend"

chosen="$(echo -e "$options" | $rofi_command -p "Uptime: $uptime" -dmenu -selected-row 0)"
case $chosen in
    $shutdown)
        systemctl poweroff
        ;;
    $reboot)
        systemctl reboot
        ;;
    $lock)
        betterlockscreen -l dimblur  ~/Picture/planet.png
        ;;
    $suspend)
        mpc -q pause
        amixer set Master mute
        systemctl suspend
        ;;
esac
