#!/bin/bash
#
#

if [ -e /etc/pacman.d/mirrorlist ];then
		echo '##china' > /etc/pacman.d/mirrorlist
		echo 'Server = http://mirrors.aliyun.com/archlinux/$repo/os/$arch' >> /etc/pacman.d/mirrorlist
	else
		touch /etc/pacman.d/mirrorlist
		echo '##china' > /etc/pacman.d/mirrorlist
		echo 'Server = http://mirrors.aliyun.com/archlinux/$repo/os/$arch' >> /etc/pacman.d/mirrorlist
fi

pacman -Syy
pacstrap -i /mnt base base-devel
sleep
genfstab -U -p /mnt >> /mnt/etc/fstab
arch-chroot /mnt /bin/bash
	