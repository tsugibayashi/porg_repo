#!/bin/bash -e
# Description: A dwm statusbar implemented in Python
# URL:         https://github.com/tsugibayashi/dwm_statusbar
# Depends on:  xsetroot dwm x11-xserver-utils python3-psutil python3-mpd python3-alsaaudio

### variables ###
name=dwm_statusbar
version=20240125
source1=${version}.tar.gz
URL1=https://github.com/tsugibayashi/${name}/archive/refs/tags/${source1}

### main routine ###
if [ ! -f $source1 ]; then
    wget $URL1
fi

if [ -d $name-$version ]; then
    rm -rf $name-$version
fi
tar zxvf $source1

### install
cd $name-$version
sudo porg -lp $name-$version 'install -m755 dwmstatusbar.py /usr/bin/dwmstatusbar.py'

