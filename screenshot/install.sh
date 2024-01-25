#!/bin/bash -e
# Description: A simple console frontend for scrot
# URL:         https://github.com/tsugibayashi/screenshot
# Depends on:  scrot

### variables ###
name=screenshot
version=20220103
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
sudo porg -lp $name-$version 'install -m755 screenshot /usr/bin/screenshot'

