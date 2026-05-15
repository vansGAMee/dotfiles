#!/bin/bash

# Получить текущую громкость в процентах (без знака %)
VOL=$(pactl get-sink-volume @DEFAULT_SINK@ | grep -oP '\d+%' | head -1 | tr -d '%')

# Количество символов в полоске (например, 10)
MAX=10

# Вычислить количество залитых блоков
FILLED=$(( VOL * MAX / 100 ))
EMPTY=$(( MAX - FILLED ))

# Собрать полоску
BAR=$(printf "█%.0s" $(seq 1 $FILLED))
BAR+=$(printf "░%.0s" $(seq 1 $EMPTY))

# Вывести полоску с иконкой (опционально)
echo "󰕾 $BAR $VOL%"
