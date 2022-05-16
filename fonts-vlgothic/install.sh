#!/bin/bash
# Description: Japanese TrueType fonts from Vine Linux
# URL: http://vlgothic.dicey.org/
# Depends on: fontconfig

### variables ###
name=fonts-vlgothic
version=20200720
source=VLGothic-${version}.tar.xz
folder=VLGothic
URL=https://osdn.net/dl/vlgothic/VLGothic-${version}.tar.xz

### main routine ###
if [ ! -f $source ]; then
    wget $URL
fi

if [ -d $folder ]; then
    rm -rf $folder
fi
tar xvf $source

cd $folder
sudo porg -lp $name-$version 'install -d -m 755 /usr/share/fonts/truetype/vlgothic/'
sudo porg -lp+ $name-$version 'cp -p *.ttf /usr/share/fonts/truetype/vlgothic/'

sudo fc-cache /usr/share/fonts/truetype/vlgothic/
#sudo mkfontscale /usr/share/fonts/truetype/vlgothic/
#sudo mkfontdir /usr/share/fonts/truetype/vlgothic/

