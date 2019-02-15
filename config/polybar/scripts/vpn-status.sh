#!/bin/bash
#
# Dependencies
#    curl
#    geoip
# NOTE: The reason I broke the UNIX "exit(0) == good" principle is because I 
#       use this script to (a) display the country of my exit VPN, and (b) to
#       exit(0) when the vpn is off. Therefore, exit(1) means VPN is running.

if [[ $(pgrep "openvpn|openconnect") ]]; then

    # Check for connectivity
    ping 8.8.8.8 -c 1 > /dev/null

    if [ "$?" -eq "0" ]; then
        STATUS=" $(geoiplookup $(curl -s "ifconfig.me/ip") | cut -f 2 -d ',')"
        echo $STATUS
        exit 0
    else
        echo " No Connectivity!"
    fi
else
    STATUS="  OFF"
    echo $STATUS
    exit 0
fi
