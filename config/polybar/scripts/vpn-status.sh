#!/bin/bash
#
# Dependencies
#    curl
#    geoip

if [[ $(pgrep "openvpn|openconnect") ]]; then

    # Check for connectivity and DNS
    #   NOTE: I use curl vs ping, because some VPN servers were dropping ICMP
    #   packets
    timeout 3 curl -s "ifconfig.me/ip" > /dev/null

    if [ "$?" -eq "0" ]; then
        STATUS=" $(geoiplookup $(curl -s "ifconfig.me/ip") | cut -f 2 -d ',')"

        if [ "$STATUS" == " GeoIP Country Edition: IP Address not found" ]; then
            echo " Couldn't resolve IP"
            exit 1
        else
            echo $STATUS
        fi
    else
        echo " IP request timeout"
        exit 1
    fi

else
    STATUS="  OFF"
    echo $STATUS
fi

exit 0
