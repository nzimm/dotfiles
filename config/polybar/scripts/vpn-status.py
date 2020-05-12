#!/usr/bin/env python3
#
# vpn status script for polybar
#
# TODO:
#   make vpn process names to scan for an argument
#   add command line arg allowing output formating
#
import requests
import subprocess
import sys
import json
from subprocess import DEVNULL as devnull


def get_ip_data():
    '''return IP address from ifconfig.me'''
    try:
        res = requests.get("http://ip-api.com/json", timeout=1)
    except:
        print(" Couldn't resolve IP")
        sys.exit(1)
    return res.text


def main():
    '''get public ip, and associated geolocation data'''
    ip_data = json.loads(get_ip_data().encode('utf-8'))
    location = "{}, {}".format(ip_data['city'], ip_data['country'])

    # vpn processes to look for
    vpn_processes = "openvpn|openconnect"

    # check for running vpn processes running
    if subprocess.run(["pgrep", vpn_processes], stdout=devnull).returncode == 0:
        print("",  location)
    else:
        print("", location)

if __name__ == "__main__":
    main()
