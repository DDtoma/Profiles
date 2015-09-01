#!/bin/bash


if [[ ! -n $(pacman -Qsq grub os-prober) ]];then
		echo 'grub is ok.'
	else
		pacman -S --noconfirm grub os-prober
fi
sleep

grub-install --recheck $#
sleep

grub-mkconfig -o /boot/grub/grub.cfg
