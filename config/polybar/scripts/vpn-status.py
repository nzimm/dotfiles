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

def format_output(res_string):
    city         = res_string.split('|')[0]
    state_code   = res_string.split('|')[1]
    country_code = res_string.split('|')[2]

    if country_code != '?':
        if city != '?':
            return " %s, %s" % (city, country_code)
        else:
            return " %s" % country_code
    else:
        return " location unknown"

def main():
    # vpn processes to look for
    #TODO make this an argument
    vpn_processes = "openvpn|openconnect"

    # check for running vpn processes running
    if subprocess.run(["pgrep", vpn_processes], stdout=devnull).returncode == 0:

        # get IP address from https://ifconfig.me
        try:
            res = requests.get("https://ifconfig.me/ip", timeout=1)
            ip = res.text
        except:
            print(" Couldn't resolve IP")
            sys.exit(1)


        # geolocate public IP
        url = 'https://www.whatsmyip.org/data/ip-geo-location.php'
        payload = {'geoipinput': ip}
        headers = {'Content-Type':'application/x-www-form-urlencoded',
                   'Referer':'https://www.whatsmyip.org/ip-geo-location/?ip=%s' % ip
        }
        try:
            resp = requests.post(url, data=payload, headers=headers, timeout=4)
        except:
            print(" geoip timeout")
            sys.exit(1)

        print(format_output(resp.text))

    else:
        print("  OFF")

if __name__ == "__main__":
    main()
