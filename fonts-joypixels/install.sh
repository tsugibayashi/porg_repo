#!/bin/bash
# Description: Emoji as a Service (formerly EmojiOne)
# URL: https://www.joypixels.com/download
# Depends on:

### variables ###
name=fonts-joypixels
version=6.6.0
source=joypixels-android.ttf
URL=https://cdn.joypixels.com/arch-linux/font/${version}/${source}

### main routine ###
if [ ! -f $source ]; then
    wget $URL
fi

# install
sudo porg -lp $name-$version 'install -d -m 755 /usr/share/fonts/truetype/joypixels/'
sudo porg -lp+ $name-$version 'cp -p *.ttf /usr/share/fonts/truetype/joypixels/'

sudo fc-cache /usr/share/fonts/truetype/joypixels/
#sudo mkfontscale /usr/share/fonts/truetype/joypixels/
#sudo mkfontdir /usr/share/fonts/truetype/joypixels/

