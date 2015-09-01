#!/bin/bash

dependence_data[0]="emacs"
dependence_data[1]="python-pip"
dependence_data[2]="clang"
i=0
length=${#dependence_data[@]}

echo 'emacs dependence...'
for dp in ${!dependence_data[@]}; do
    tem_data[$dp]=`pacman -Qsq ^${dependence_data[$dp]}`
done

while [ $i -lt $length ]; do
    if [[ "${dependence_data[i]}" = "${tem_data[$i]}" ]]; then
        echo "${dependence_data[$i]} is OK"
    else
        echo "dont have ${dependence_data[i]}"
        echo ${dependence_data[$i]} >> $HOME/Profiles/no_dp
    fi
    let "i++"
done
unset dependence_data[@]
