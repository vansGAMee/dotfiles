#!/bin/bash
COUNTRY=$(curl -s --max-time 5 ipinfo.io/country 2>/dev/null)
[ -z "$COUNTRY" ] && echo "󰖂 ?" || echo "󰖂 $COUNTRY"
