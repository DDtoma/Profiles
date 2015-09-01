#! /bin/bash

set ignoregrp = "base base-devel"
set ignorepkg = ""
comm -23 <(pacman -Qqt | sort) <(echo $ignorepkg | tr ' ' '\n' | cat <(pacman -Sqg $ignoregrp) - | sort -u)
