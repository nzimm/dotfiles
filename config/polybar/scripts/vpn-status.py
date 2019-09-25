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
from subprocess import DEVNULL as devnull


def get_ip():
    '''return IP address from ifconfig.me'''
    try:
        res = requests.get("https://ifconfig.me/ip", timeout=1)
        return res.text
    except:
        return " Couldn't resolve IP"


def get_geodata(ip):
    '''return geolocation data for public IP from whatsmyip.org'''
    url = 'https://www.whatsmyip.org/data/ip-geo-location.php'
    payload = {'geoipinput': ip}
    headers = {'Content-Type':'application/x-www-form-urlencoded',
               'Referer':'https://www.whatsmyip.org/ip-geo-location/?ip=%s' % ip
    }
    try:
        resp = requests.post(url, data=payload, headers=headers, timeout=4)
    except:
        return " geoip timeout"

    return resp.text


def format_output(res_string):
    '''extract and format geodata'''
    city         = res_string.split('|')[0]
    state_code   = res_string.split('|')[1]
    country_code = res_string.split('|')[2]

    if country_code != '?':
        if city != '?':
            return "%s, %s" % (city, country_code)
        else:
            return "%s" % country_code
    else:
        return "location unknown"


def main():
    '''get public ip, and associated geolocation data'''
    ip = get_ip()
    geodata = get_geodata(ip)
    location = format_output(geodata)

    # vpn processes to look for
    vpn_processes = "openvpn|openconnect"

    # check for running vpn processes running
    if subprocess.run(["pgrep", vpn_processes], stdout=devnull).returncode == 0:
        print("",  location)
    else:
        print("", location)

if __name__ == "__main__":
    main()
