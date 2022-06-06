#!/bin/bash
# Description: Japanese TrueType font for developers by mixing Inconsolata and Circle M+ 1m
# URL: https://github.com/mzyy94/RictyDiminished-for-Powerline
# Depends on: fontconfig

### variables ###
name=fonts-ricty-powerline
version=3.2.4
source1=${version}-powerline-early-2016.tar.gz
URL1=https://github.com/mzyy94/RictyDiminished-for-Powerline/archive/refs/tags/$source1

### main routine ###
# download
if [ ! -f $source1 ]; then
    wget $URL1
fi

if [ -d RictyDiminished-for-Powerline-${version}-powerline-early-2016 ]; then
    rm -rf RictyDiminished-for-Powerline-${version}-powerline-early-2016
fi
tar zxvf $source1

# install
cd RictyDiminished-for-Powerline-${version}-powerline-early-2016/powerline-fontpatched/
sudo porg -lp $name-$version 'install -d -m 755 /usr/share/fonts/truetype/ricty-powerline/'
sudo porg -lp+ $name-$version 'cp -p *.ttf /usr/share/fonts/truetype/ricty-powerline/'

sudo fc-cache /usr/share/fonts/truetype/ricty-powerline/

