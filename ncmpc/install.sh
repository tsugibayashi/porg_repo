#!/bin/bash
# Description: Fully featured MPD client which runs in a terminal
# URL:         https://www.musicpd.org/clients/ncmpc/
# Depends on: libmpdclient-devel meson lirc-devel pcre2-devel python310-Sphinx

### variables ###
name=ncmpc
version=0.47
source1=${name}-${version}.tar.xz
URL_source1=https://www.musicpd.org/download/$name/0/${source1}

### main routine ###
if [ ! -f $source1 ]; then
    wget $URL_source1
fi

if [ -d $name-$version ]; then
    rm -rf $name-$version
fi
tar xf ${source1}

if [ -d build ]; then
    rm -rf build
fi
if [ -d temp ]; then
    rm -rf temp
fi

# build
meson setup --prefix=/usr build $name-$version
ninja -C build

# install
DESTDIR=../temp ninja -C build install

gzip temp/usr/share/man/man1/ncmpc.1
sudo porg -lp $name-$version 'cp -p temp/usr/bin/* /usr/bin/'
sudo porg -lp+ $name-$version 'cp -p temp/usr/share/man/man1/* /usr/share/man/man1/'

rm -rf temp

