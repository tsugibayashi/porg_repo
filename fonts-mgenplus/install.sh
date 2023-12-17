#!/bin/bash
# Description: Mgen+ Japanese outline fonts (M+ + Noto CJK)
# URL: http://jikasei.me/font/mgenplus/
# Depends on: 

### variables ###
name=fonts-mgenplus
version=20150602
source=mgenplus-${version}.7z
URL=https://ftp.iij.ad.jp/pub/osdn.jp/users/8/8597/${source}

### main routine ###
if [ ! -f $source ]; then
    wget $URL
fi

if [ -d ${name}-${version} ]; then
    rm -rf ${name}-${version}
fi
7z x ${source} -o${name}-${version}

# build
cd ${name}-${version}/

# install
sudo porg -lp $name-$version 'install -d -m 755 /usr/share/fonts/truetype/mgenplus/'
sudo porg -lp+ $name-$version 'install -m 644 *.ttf /usr/share/fonts/truetype/mgenplus/'

sudo fc-cache /usr/share/fonts/truetype/mgenplus/

