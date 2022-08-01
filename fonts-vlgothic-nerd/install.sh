#!/bin/bash
# Description: Japanese TrueType fonts from Vine Linux
# URL: https://github.com/tsunesan3/awsome-jp-coding-fonts
# Depends on: fontconfig

### variables ###
name=fonts-vlgothic-nerd
version=20141206
source=VLGothic.ttf
URL=https://github.com/tsunesan3/awsome-jp-coding-fonts/raw/master/VLGothic/$source

### main routine ###
# download
if [ ! -f $source ]; then
    wget $URL
fi

# install
sudo porg -lp $name-$version 'install -d -m 755 /usr/share/fonts/truetype/vlgothic/'
sudo porg -lp+ $name-$version 'cp -p *.ttf /usr/share/fonts/truetype/vlgothic/'

sudo fc-cache /usr/share/fonts/truetype/vlgothic/
#sudo mkfontscale /usr/share/fonts/truetype/vlgothic/
#sudo mkfontdir /usr/share/fonts/truetype/vlgothic/

