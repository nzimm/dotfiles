#!/bin/bash
#
# Dependencies
#    curl
#    geoip
# NOTE: The reason I broke the UNIX "exit(0) == good" principle is because I 
#       use this script to (a) display the country of my exit VPN, and (b) to
#       exit(0) when the vpn is off. Therefore, exit(1) means VPN is running.

VPN_IFACE=$(nmcli con show | grep tun0 | cut -d ' ' -f1)

if [[ "$VPN_IFACE" == "tun0" ]]; then
    STATUS=" $(geoiplookup $(curl -s "ifconfig.me/ip") | cut -f 2 -d ',')"
else
    STATUS="OFF"
    exit 0
fi

echo $STATUS
exit 1
