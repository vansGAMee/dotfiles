#!/bin/bash
IFACE=$(ip route show default | awk '/default/ {print $5; exit}')
[ -z "$IFACE" ] && echo "↓0K ↑0K" && exit
RX1=$(cat /sys/class/net/$IFACE/statistics/rx_bytes 2>/dev/null || echo 0)
TX1=$(cat /sys/class/net/$IFACE/statistics/tx_bytes 2>/dev/null || echo 0)
sleep 1
RX2=$(cat /sys/class/net/$IFACE/statistics/rx_bytes 2>/dev/null || echo 0)
TX2=$(cat /sys/class/net/$IFACE/statistics/tx_bytes 2>/dev/null || echo 0)
RX=$(( (RX2 - RX1) / 1024 ))
TX=$(( (TX2 - TX1) / 1024 ))
echo "↓${RX}K ↑${TX}K"
