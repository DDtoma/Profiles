#!/bin/bash
#
#
IPTABLES="/usr/bin/iptables"
REDSOCKS="/usr/bin/redsocks"
REDSOCKSCFG="/etc/redsocks.conf"
REDSOCKS_PORT="54321" #local_port in $REDSOCKSCFG
SERVER=45.116.12.24

if [ "$1" = "start" ];then
    echo 'starting redsocks...'
    sleep 1
    $REDSOCKS -c $REDSOCKSCFG
    iptables -t nat -A OUTPUT -d $SERVER_IP -j RETURN
    iptables -t nat -A OUTPUT -d 10.0.0.0/8 -j RETURN
    iptables -t nat -A OUTPUT -d 172.16.0.0/16 -j RETURN
    iptables -t nat -A OUTPUT -d 192.168.0.0/16 -j RETURN
    iptables -t nat -A OUTPUT -d 127.0.0.0/8 -j RETURN
    iptables -t nat -A OUTPUT -p tcp -j REDIRECT --to-ports $REDSOCKS_PORT
elif [ "$1" = "stop" ];then
    kill `pidof redsocks`
    iptables -t nat -D OUTPUT 6
    iptables -t nat -D OUTPUT 5
    iptables -t nat -D OUTPUT 4
    iptables -t nat -D OUTPUT 3
    iptables -t nat -D OUTPUT 2
    iptables -t nat -D OUTPUT 1

else
    exit 1;
fi
