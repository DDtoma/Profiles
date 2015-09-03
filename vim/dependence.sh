#!/bin/bash

dependence_data[0]="vim-runtime"
i=0
length=${#dependence_data[@]}

for dp in ${!dependence_data[@]}; do
    tem_data[$dp]=`pacman -Qsq ^${dependence_data[$dp]} | head -n 1`
done

echo 'vim dependence...'
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
