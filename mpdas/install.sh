#!/bin/bash
# Description: An AudioScrobbler client for MPD written in C++.
# URL:         http://50hz.ws/mpdas/
# Depends on: libmpdclient-devel libcurl-devel

### variables ###
name=mpdas
version=0.4.5
source1=${version}.tar.gz
URL_source1=https://github.com/hrkfdn/${name}/archive/${source1}

### main routine ###
if [ ! -f $source1 ]; then
    wget $URL_source1
fi

if [ -d $name-$version ]; then
    rm -rf $name-$version
fi
tar zxf ${source1}

# build
cd $name-$version
make PREFIX=/usr CONFIG=/etc

# install
sudo porg -lp $name-$version \
          'make install PREFIX=/usr MANPREFIX=/usr/share/man/man1'

