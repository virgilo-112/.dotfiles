```bash
#!/bin/bash

get_sink_ids() {
    pactl list sinks | awk '
        /^Sink #[0-9]+/ {
            id = $2
            sub("#", "", id)
        }
        /^[[:space:]]*Name:/ {
            name = $2
        }
        /^[[:space:]]*Description:/ {
            desc = $0
            sub(/^[[:space:]]*Description:[[:space:]]*/, "", desc)

            if (desc !~ /HDMI/) {
                print id "|" name "|" desc
            }
        }
    '
}

change_sink() {
    local name="$1"
    local description="$2"

    pactl set-default-sink "$name" || exit 1
    notify-send "Changed audio sink to" "$description"
}

mapfile -t sinks < <(get_sink_ids)

if (( ${#sinks[@]} <= 1 )); then
    notify-send "Not enough audio sinks found, unchanged"
    echo "Not enough sinks!"
    exit 1
fi

current_sink=$(pactl get-default-sink)
active_index=-1

for i in "${!sinks[@]}"; do
    IFS='|' read -r id name description <<< "${sinks[$i]}"

    if [[ "$name" == "$current_sink" ]]; then
        active_index=$i
    fi
done

if (( active_index == -1 )); then
    echo "Couldn't find current sink; selecting first available"
    IFS='|' read -r id name description <<< "${sinks[0]}"
    change_sink "$name" "$description"
    exit
fi

next_index=$(( (active_index + 1) % ${#sinks[@]} ))
IFS='|' read -r id name description <<< "${sinks[$next_index]}"

change_sink "$name" "$description"
```