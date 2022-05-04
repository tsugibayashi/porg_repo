#!/bin/bash -e
# Description: A simple console frontend for scrot
# URL:         https://github.com/tsugibayashi/screenshot
# Depends on:  scrot

### variables ###
name=screenshot
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
sudo porg -lp $name-$version 'install -m755 screenshot /usr/bin/screenshot'

