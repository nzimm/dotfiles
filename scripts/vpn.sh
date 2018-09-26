#!/bin/bash
#
# Dependencies
#    curl
#    geoip

VPN_IFACE=$(nmcli con show | grep tun0 | cut -d ' ' -f1)

if [[ "$VPN_IFACE" == "tun0" ]]; then
    STATUS="$(geoiplookup $(curl -s "ifconfig.me/ip") | cut -f 2 -d ',')"
    COLOR="#00FF00"
else
    STATUS="OFF"
    COLOR="#FF0000"
fi

echo $STATUS
echo $STATUS
echo $COLOR
