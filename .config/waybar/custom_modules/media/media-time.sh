#!/usr/bin/env bash

while true; do
    position=$(playerctl position 2>/dev/null)
    length=$(playerctl metadata --format '{{mpris:length}}' 2>/dev/null)

    if [[ -n "$position" ]]; then
        position_seconds=${position%.*}
        minutes=$((position_seconds / 60))
        seconds=$((position_seconds % 60))

        if [[ -n "$length" && "$length" != "0" ]]; then
            length_seconds=$((length / 1000000))
            total_minutes=$((length_seconds / 60))
            total_seconds=$((length_seconds % 60))

            printf '%d:%02d/%d:%02d\n' \
                "$minutes" "$seconds" \
                "$total_minutes" "$total_seconds"
        else
            printf '%d:%02d\n' "$minutes" "$seconds"
        fi
    else
        echo ""
    fi

    sleep 1
done
