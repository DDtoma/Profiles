#!/bin/bash

dependence_data[0]="i3-gaps-git"
dependence_data[1]="i3status"
dependence_data[2]="j4-dmenu-desktop"
dependence_data[3]="xmobar"
dependence_data[4]="pulseaudio"
i=0
length=${#dependence_data[@]}

echo 'i3 dependence......'
for dp in ${!dependence_data[@]}; do
    tem_data[$dp]=`pacman -Qsq ^${dependence_data[$dp]} | head -n 1`
done

while [ $i -lt $length ]; do
    if [[ "${dependence_data[i]}" = "${tem_data[$i]}" ]]; then
        echo "${dependence_data[$i]} is OK"
    else
        echo "dont have ${dependence_data[i]}"
        echo ${dependence_data[$i]} >> $HOME/no_dp
    fi
    let "i++"
done
unset dependence_data[@]

