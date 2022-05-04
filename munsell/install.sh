#!/bin/bash -e
# Description: Munsell is used to adjust the backlight brightness using light based on the Munsell color system
# URL:         https://github.com/tsugibayashi/munsell
# Depends on:  xbacklight light

### variables ###
name=munsell
version=1
URL1=https://github.com/tsugibayashi/$name.git

### main routine ###
if [ -d $name-$version ]; then
    rm -rf $name-$version
fi
if [ ! -d $name-$version ]; then
    git clone $URL1 $name-$version
fi

### install
cd $name-$version
sudo porg -lp $name-$version 'install -m755 munsell.py /usr/bin/munsell.py'

