#!/bin/bash
comm -23 <(pacman -Qeq | sort) <(pacman -Qgq base base-devel) > data_tmp
comm -23 <(cat data_tmp | sort) <(pacman -Qm) > packages_data
rm data_tmp
