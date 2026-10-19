#!/usr/bin/env bash

if [ -z "$1" ]; then
    echo "Usage: yt-opus <URL>"
    exit 1
fi

yt-dlp \
    --cookies-from-browser firefox \
    -x \
    --audio-format opus \
    --audio-quality 128K \
    --embed-metadata \
    --embed-thumbnail \
    --convert-thumbnails jpg \
    -o "$HOME/Musique/%(artist)s - %(title)s [%(id)s].%(ext)s" \
    "$1"