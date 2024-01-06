#!/bin/bash -e
# Description: A dwm statusbar implemented in Python
# URL:         https://github.com/tsugibayashi/dwm_statusbar.py
# Depends on:  xsetroot dwm x11-xserver-utils python3-psutil python3-mpd python3-alsaaudio

### variables ###
name=dwm_statusbar
version=20231203
URL1=https://github.com/tsugibayashi/${name}.py.git

### main routine ###
if [ -d $name-$version ]; then
    rm -rf $name-$version
fi
if [ ! -d $name-$version ]; then
    git clone $URL1 $name-$version
fi

### install
cd $name-$version
sudo porg -lp $name-$version 'install -m755 dwm_statusbar.py /usr/bin/dwm_statusbar.py'

