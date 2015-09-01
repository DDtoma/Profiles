#!/bin/bash
#
#configure wifi
#

if [[ ! -n $(pacman -Qsq iw wpa_supplicant dialog) ]];then
		echo 'wifi is ok.'
	else
		pacman -S --noconfirm iw wpa_supplicant dialog
fi

if [ ! -e /etc/supplicant.conf ];then
		touch /etc/supplicant.conf
	else
		ip link set $# up
		wpa_supplicant -B -D nl80211,wext -c /etc/wpa_supplicant.conf -i $#
		dhcpcd -A $#
fi

echo 'ctrl_interface=DIR=/run/wpa_supplicant' > /etc/wpa_supplicant.conf
wpa_passphrase "llhome" "472597gpaj"
ip link set $# up
wpa_supplicant -B -D nl80211,wext -c /etc/wpa_supplicant.conf -i $#
dhcpcd -A $#