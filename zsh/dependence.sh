#!/bin/bash

dependence_data[0]="zsh"
dependence_data[1]="autojump"
dependence_data[2]="asddd"
i=0
length=${#dependence_data[@]}

echo 'zsh dependence...'
# while [ $i -lt $length ]; do
#     if ! type ${dependence[i]}> /dev/null 2>&1;then
#         echo "dont have ${dependence_data[i]}"
#         echo ${dependence_data[$i]} >> $HOME/Profiles/no_dp
#         error=1
#     else
#         echo "${dependence_data[i]} is OK"
#     fi
#     let "i++"
# done
for dp in ${!dependence_data[@]}; do
    echo `pacman -Qsq ^${dependence_data[$dp]}`
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
