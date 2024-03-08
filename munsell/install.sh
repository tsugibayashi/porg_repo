#!/bin/bash -e
# Description: Munsell is used to adjust the backlight brightness using light based on the Munsell color system
# URL:         https://github.com/tsugibayashi/munsell
# Depends on:  xbacklight light

### variables ###
name=munsell
version=20220306
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
sudo porg -lp $name-$version 'install -m755 munsell.py /usr/bin/munsell.py'

