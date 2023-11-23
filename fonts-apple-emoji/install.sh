#!/bin/bash
# Description: Apple Color Emoji is a color typeface used by iOS and macOS to display emoji
# URL: https://github.com/samuelngs/apple-emoji-linux
# Depends on:

### variables ###
name=fonts-apple-emoji
version=16.4-patch.1
source=AppleColorEmoji.ttf
URL=https://github.com/samuelngs/apple-emoji-linux/releases/download/v${version}/${source}

### main routine ###
if [ ! -f $source ]; then
    wget $URL
fi

# install
sudo porg -lp $name-$version 'install -d -m 755 /usr/share/fonts/truetype/apple-emoji/'
sudo porg -lp+ $name-$version 'cp -p *.ttf /usr/share/fonts/truetype/apple-emoji/'

sudo fc-cache /usr/share/fonts/truetype/apple-emoji/
#sudo mkfontscale /usr/share/fonts/truetype/apple-emoji/
#sudo mkfontdir /usr/share/fonts/truetype/apple-emoji/

