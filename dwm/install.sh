#!/bin/bash
# Description: dynamic window manager
# URL:         http://dwm.suckless.org/
# Depends on: xorg-dev

### variables ###
name=dwm
version=6.5
source1=$name-$version.tar.gz
URL_source1=http://dl.suckless.org/dwm/$source1
source2=dwm.desktop
patch1=dwm-bottomgaps-6.4.diff
config1=config.h

### main routine ###
if [ ! -f $source1 ]; then
    wget $URL_source1
fi
if [ ! -f $patch1 ]; then
    echo '[Error] not found '$patch1
    exit 1
fi
if [ ! -f $source2 ]; then
    echo '[Error] not found '$source2
    exit 1
fi
if [ ! -f $config1 ]; then
    echo '[Error] not found '$config1
    exit 1
fi

if [ -d $name-$version ]; then
    rm -rf $name-$version
fi
tar zxvf $source1

# patch to dwm
cd $name-$version
patch -p1 < ../$patch1

# build dwm
cp ../$config1 .
make

# install dwm
sudo porg -lp $name-$version \
	'make PREFIX=/usr MANPREFIX=/usr/share/man install'

# install dwm.desktop
cd ..
sudo porg -lp+ $name-$version \
	"install -m 644 $source2 /usr/share/xsessions/"

