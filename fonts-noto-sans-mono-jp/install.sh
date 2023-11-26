#!/bin/bash
# Description: Google Noto Sans Monospace Japanese fonts
# URL: https://github.com/googlefonts/noto-cjk
# Depends on:

### variables ###
name=fonts-noto-sans-mono-jp
version=2.004
source1=11_NotoSansMonoCJKjp.zip
URL1=https://github.com/googlefonts/noto-cjk/releases/download/Sans2.004/$source1

### main routine ###
if [ -d $name-$version ]; then
    rm -rf $name-$version
fi
if [ ! $source1 ]; then
    wget $URL1
fi
unzip $source1 -d $name-$version

# install
cd $name-$version
sudo porg -lp $name-$version 'install -d -m 755 /usr/share/fonts/truetype/'
sudo porg -lp+ $name-$version 'install -m 644 NotoSansMonoCJKjp-Bold.otf /usr/share/fonts/truetype/'
sudo porg -lp+ $name-$version 'install -m 644 NotoSansMonoCJKjp-Regular.otf /usr/share/fonts/truetype/'

sudo fc-cache /usr/share/fonts/truetype/
#sudo mkfontscale /usr/share/fonts/truetype/
#sudo mkfontdir /usr/share/fonts/truetype/

