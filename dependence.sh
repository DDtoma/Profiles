#!/bin/bash
dependence_data[0]="git"
dependence_data[1]="yaourt"
i=0
length=${#dependence_data[@]}
while [ $i -lt $length ]; do
    if ! type ${dependence[i]}> /dev/null 2>&1;then
        echo "dont have ${dependence_data[i]}"
        echo "please use $HOME/Pofiles/sys.sh to install dependences"
        error=1
    else
        echo "${dependence_data[i]} is OK"
    fi
    let "i++"
done
unset dependence_data[@]
