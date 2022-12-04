#!/bin/bash -e
# Description: Python library which provides a client interface for the Music Player Daemon
# URL:         https://github.com/Mic92/python-mpd2
# Depends on:  python3

### variables ###
name=python-mpd2
version=3.0.5
URL1=https://github.com/Mic92/$name.git

### main routine ###
if [ -d $name-$version ]; then
    rm -rf $name-$version
fi
if [ ! -d $name-$version ]; then
    git clone $URL1 -b v${version} --depth 1 $name-$version
fi

if [ -d pkgdir ]; then
    rm -rf pkgdir
fi

CURRENT_DIR=`pwd`

### build
cd $name-$version
python setup.py build

### install
python setup.py install --root ${CURRENT_DIR}/pkgdir --prefix usr \
                        --optimize=1 --skip-build

cd -
INSTALL_DIR=`find pkgdir | grep site-packages$ | sed -e 's/pkgdir//'`
sudo porg -lp $name-$version "cp -rp pkgdir/${INSTALL_DIR}/* ${INSTALL_DIR}"

