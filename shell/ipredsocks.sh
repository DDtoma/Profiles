#!/bin/sh

IPTABLES="/usr/bin/iptables"
REDSOCKS="/usr/bin/redsocks"
REDSOCKSCFG="/etc/redsocks.conf"
REDSOCKS_PORT="12345" #local_port in $REDSOCKSCFG
PDNSDCFG="/etc/pdnsd.conf"
SERVER="45.56.91.38"

if [ "$1" = "start" ]; then
        echo '(Re)starting redsocks...'
        sleep 1
        $REDSOCKS -c $REDSOCKSCFG
        $IPTABLES -t nat -X REDSOCKS
        $IPTABLES -t nat -N REDSOCKS
        $IPTABLES -t nat -I REDSOCKS -o lo -j RETURN

        echo 'setup iptables rules'
        sleep 1
# Do not redirect LAN traffic and some other reserved addresses. (blacklist option)
        $IPTABLES -t nat -A REDSOCKS -d 0.0.0.0/8 -j RETURN
        $IPTABLES -t nat -A REDSOCKS -d 10.0.0.0/8 -j RETURN
        $IPTABLES -t nat -A REDSOCKS -d 10.10.1.0/22 -j RETURN
        $IPTABLES -t nat -A REDSOCKS -d 127.0.0.0/8 -j RETURN
        $IPTABLES -t nat -A REDSOCKS -d 169.254.0.0/16 -j RETURN
        $IPTABLES -t nat -A REDSOCKS -d 172.16.0.0/12 -j RETURN
        $IPTABLES -t nat -A REDSOCKS -d 192.168.0.0/16 -j RETURN
        $IPTABLES -t nat -A REDSOCKS -d 224.0.0.0/4 -j RETURN
        $IPTABLES -t nat -A REDSOCKS -d 240.0.0.0/4 -j RETURN
        # $IPTABLES -t nat -A REDSOCKS -d $SERVER -j RETURN 
        $IPTABLES -t nat -A REDSOCKS -j REDSOCKS

# Redirect all traffic that gets to the end of our chain
        $IPTABLES -t nat -A REDSOCKS   -p tcp -j REDIRECT --to-port $REDSOCKS_PORT

## Filter all traffic from the own host
## BE CAREFULL HERE IF THE SOCKS-SERVER RUNS ON THIS MACHINE
        $IPTABLES -t nat -I OUTPUT -p tcp -j REDSOCKS

# Filter all traffic that is routed over this host
        $IPTABLES -t nat -A PREROUTING -p tcp -s $SERVER/20211 -j REDSOCKS

        echo 'IPtables reconfigured.'
        exit 0;
elif [ "$1" = "stop" ]; then
        $IPTABLES -t nat -F
        $IPTABLES -t nat -X
        $IPTABLES -t nat -Z
        killall redsocks
        exit 0;
else
        exit 1;
fi
