#!/bin/zsh
#

start_ss ()
{
    echo "Start Shadowsocks"
    sslocal -c /etc/shadowsocks/config.json
}

case "$1" in
    start)
        start_ss
        cd /usr/bin/
