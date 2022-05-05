#!/bin/bash
# Description:	Improved sct (set screen color temperature)
# URL:		https://github.com/faf0/sct
# Depends on:

### variables ###
name=xsct
version=1.6.1
source1=${version}.tar.gz
URL1=https://github.com/faf0/sct/archive/refs/tags/${source1}

### main routine ###
if [ ! -f $source1 ]; then
    wget $URL1
fi

if [ -d sct-$version ]; then
    rm -rf sct-$version
fi
tar zxvf ${version}.tar.gz

# build
cd sct-${version}
make

# install
sudo porg -lp $name-$version 'make install'

