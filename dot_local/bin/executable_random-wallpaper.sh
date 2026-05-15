#!/bin/bash

WALLPAPER_DIR="$HOME/Videos"
MONITOR="HDMI-A-1"

mapfile -t VIDEOS < <(find "$WALLPAPER_DIR" -maxdepth 1 -type f -iname "*.mp4")
if [ ${#VIDEOS[@]} -eq 0 ]; then
    echo "Нет видео в $WALLPAPER_DIR"
    exit 1
fi

RANDOM_VIDEO=$(printf "%s\n" "${VIDEOS[@]}" | shuf -n1)

killall mpvpaper 2>/dev/null
rm -f /tmp/mpv-video.sock

mpvpaper -o "no-audio --loop --input-ipc-server=/tmp/mpv-video.sock" "$MONITOR" "$RANDOM_VIDEO" &
