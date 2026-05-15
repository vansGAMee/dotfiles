#!/bin/bash
lang=$(hyprctl devices -j 2>/dev/null | jq -r '.keyboards[] | select(.main == true) | .active_keymap' | cut -d'(' -f1 | xargs)
if [[ $lang == "Russian" ]]; then
    echo "🇷🇺 RU"
elif [[ $lang == "English" ]]; then
    echo "🇺🇸 EN"
else
    echo "⌨️ $lang"
fi
