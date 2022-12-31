#!/bin/bash
# Description: Program to easily change brightness on backlight-controllers.
# URL:         https://github.com/haikarainen/light
# Depends on: build-essential

### variables ###
name=light
version=1.2.2
source1=v${version}.tar.gz
patch1=114.patch
patch2=122.patch
URL_source1=https://github.com/haikarainen/light/archive/${source1}
URL_patch1=https://github.com/archlinux/svntogit-community/raw/packages/light/trunk/${patch1}
URL_patch2=https://github.com/archlinux/svntogit-community/raw/packages/light/trunk/${patch2}

### main routine ###
if [ ! -f $source1 ]; then
    wget $URL_source1
fi
if [ ! -f $patch1 ]; then
    wget $URL_patch1
fi
if [ ! -f $patch2 ]; then
    wget $URL_patch2
fi

if [ -d $name-$version ]; then
    rm -rf $name-$version
fi
tar zxf ${source1}

# patch
cd $name-$version
patch -Np1 -i ../${patch1}
patch -Np1 -i ../${patch2}

# build
./autogen.sh
./configure --prefix=/usr --with-udev
make

# install
sudo porg -lp $name-$version 'make PREFIX=/usr install'

echo '=============================================='
echo 'Make sure to add your user to the video group.'
echo '=============================================='

