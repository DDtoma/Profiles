#/bin/bash

/etc/pacman.d/mirrorlist < cat <<EOF
Server = http://mirrors.aliyun.com/archlinux/$repo/os/$arch
EOF
/etc/pacman.conf << cat <<EOF
[archlinuxfr]
SigLevel = Never
Server = http://repo.archlinux.fr/$arch
EOF
pacman -Syy

/etc/environment < cat <<EOF
export LC_CTYPE=zh_CN.UTF-8
EOF

ln s $HOME/Profiles/.xinitrc ~
