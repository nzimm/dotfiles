#!/bin/bash
#
# Dependencies
#    termite
#

WLAN_RE="\swl.*:"
WLAN_INTERFACE=$(ip link | grep -o $WLAN_RE)
echo "found $WLAN_INTERFACE"
STATUS=$(ip link | grep $WLAN_RE | awk '{print $9}') # UP, DOWN or UNKNOWN
echo "found $STATUS"

if [ $STATUS != "DOWN" ]; then
    echo "Turning $WLAN_INTERFACE OFF"
    ip link set $WLAN_INTERFACE down
    exit 0
elif [ $STATUS != "UP" ]; then
    echo "Turning $WLAN_INTERFACE ON"
    ip link set $WLAN_INTERFACE up
    exit 0
fi
