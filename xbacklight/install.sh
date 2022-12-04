#!/bin/bash
# Description:	RandR-based backlight control application
# URL:		https://xorg.freedesktop.org/
# Depends on:

### variables ###
name=xbacklight
version=1.2.3
source1=${name}-${version}.tar.bz2
URL1=https://xorg.freedesktop.org/archive/individual/app/${name}-${version}.tar.bz2

### main routine ###
if [ ! -f $source1 ]; then
    wget $URL1
fi

if [ -d $name-$version ]; then
    rm -rf $name-$version
fi
tar jxvf ${source1}

# build
cd ${name}-${version}
./configure --prefix=/usr
make

# install
sudo porg -lp $name-$version 'make install'

