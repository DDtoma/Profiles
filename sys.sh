#/bin/bash

/etc/pacman.d/mirrorlist < cat <<EOF
Server = http://mirrors.aliyun.com/archlinux/$repo/os/$arch
EOF
pacman -Syy
pacman -S <(cat $HOME/Profiles/package_data)

function insyaourt{
    cd /tmp
    echo 'install yaout'
    git clone https://aur.archlinux.org/package-query.git
    cd package-query
    makepkg -si
    pacman -U *.tar.xz
    sleep 2

    cd ..
    git clone https://aur.archlinux.org/yaourt.git
    cd yaourt
    makepkg -si
    cd ..
    pacman -U *.tar.xz
    echo 'fineshed'
}
insyaourt

/etc/environment < cat <<EOF
export LC_CTYPE=zh_CN.UTF-8
EOF

ln s $HOME/Profiles/.xinitrc ~
