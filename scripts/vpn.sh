#!/bin/bash
#
# Dependencies
#    curl
#    geoip

VPN_IFACE=$(nmcli con show | grep tun0 | cut -d ' ' -f1)
PUBLIC=$(curl -s "ifconfig.me/ip")

if [[ "$VPN_IFACE" == "tun0" ]]; then
    STATUS="$(geoiplookup ${PUBLIC} | cut -f 2 -d ',')"
    COLOR="#00FF00"
else
    STATUS="OFF"
    COLOR="#FF0000"
fi

echo $STATUS
echo $STATUS
echo $COLOR
