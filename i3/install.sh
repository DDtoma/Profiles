#!/bin/bash
path=$HOME/.i3

function install-i3(){
    cp -rf $HOME/Profiles/i3/* ${path}
}

if [[ -e ${path} ]]; then
    install-i3
else
    mkdir -p ${path}
    install-i3
fi

ln -s $HOME/Profile/i3/.mobarrc $Home/.xmobarrc
unset path

