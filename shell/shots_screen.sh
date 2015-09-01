#!/bin/bash
scrot -s -d 5 '%y-%m-%d_$wx$h.png' -e 'mv $f ~/shots'
