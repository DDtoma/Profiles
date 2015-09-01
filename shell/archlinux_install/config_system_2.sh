#!/bin/bash


echo 'upgrade locale......'
if [ -e /etc/locale.gen ];then
		echo 'en_US.UTF-8 UTF-8' > /etc/locale.gen
		echo 'zh_CN.UTF-8 UTF-8' > /etc/locale.gen
		echo 'zh_CN.GBK GBK' > /etc/locale.gen
		echo 'zh_CN.GB2312 GB2312' > /etc/locale.gen
		echo 'zh_CN.GB18030 GB18030' > /etc/locale.gen
		locale-gen
	else
		touch /etc/locale.gen
		echo 'en_US.UTF-8 UTF-8' > /etc/locale.gen
		echo 'zh_CN.UTF-8 UTF-8' > /etc/locale.gen
		echo 'zh_CN.GBK GBK' > /etc/locale.gen
		echo 'zh_CN.GB2312 GB2312' > /etc/locale.gen
		echo 'zh_CN.GB18030 GB18030' > /etc/locale.gen
		locale-gen
fi
sleep

if [ -e /etc/locale.conf ];then
		echo 'LANG=en_US.UTF-8' > /etc/locale.conf
		pacman -S adobe-source-code-pro-fonts adobe-source-sans-pro-fonts adobe-source-serif-pro-fonts
	else
		touch /etc/locale.conf
		echo 'LANG=en_US.UTF-8' > /etc/locale.conf
		pacman -S adobe-source-code-pro-fonts adobe-source-sans-pro-fonts adobe-source-serif-pro-fonts
fi
sleep

echo 'setup vconsole .......'
if [ -e /etc/vconsole.conf ];then
		echo 'KEYMAP=us' > /etc/vconsole.conf
		echo 'FONT=lat9w-16' >> /etc/vconsole.conf
	else
		touch /etc/vconsole.conf
		echo 'KEYMAP=us' > /etc/vconsole.conf
		echo 'FONT=lat9w-16' >> /etc/vconsole.conf
fi
sleep

echo 'configure time......'
if [ -e /usr/share/zoneinfo/Asia/Shanghai ];then
		ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
		hwclock --systohc --utc
	else
		echo 'dont have .../Asia/Shanghai'
		exit 1
fi
sleep


if [ -e /etc/hostname ];then
		echo 'toma' > /etc/hostname 
	else
		touch /etc/hostname
		echo 'toma' > /etc/hostname
fi




		

