#!/bin/bash
# Description:	Simple command-line screenshot utility for X
# URL:		https://github.com/resurrecting-open-source-projects/scrot
# Depends on:   autoconf-archive libXcomposite-devel imlib2-devel libbsd-devel

### variables ###
name=scrot
version=1.7
source1=${name}-${version}.tar.gz
URL1=https://github.com/resurrecting-open-source-projects/${name}/archive/${version}/${source1}

### main routine ###
if [ ! -f $source1 ]; then
    wget $URL1
fi

if [ -d $name-$version ]; then
    rm -rf $name-$version
fi
tar zxvf ${source1}

# prepare
cd ${name}-${version}
autoreconf -fiv

# build
./configure --prefix=/usr --mandir=/usr/share/man
make

# install
sudo porg -lp $name-$version 'make install'

