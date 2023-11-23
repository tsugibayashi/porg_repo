#!/bin/bash
# Description: Twitter Color Emoji for everyone.
# URL: https://github.com/twitter/twemoji
# Depends on: rpm2cpio

### variables ###
name=fonts-twemoji
version=14.0.2
source1=twitter-twemoji-fonts-${version}-4.fc39.noarch.rpm
source2=75-fonts-twemoji.conf
URL1=https://kojipkgs.fedoraproject.org//packages/twitter-twemoji-fonts/${version}/4.fc39/noarch/twitter-twemoji-fonts-${version}-4.fc39.noarch.rpm
URL2=https://aur.archlinux.org/cgit/aur.git/plain/75-twemoji.conf?h=ttf-twemoji

### main routine ###
if [ ! -f $source1 ]; then
    wget $URL1
fi
if [ ! -f $source2 ]; then
    wget -O $source2 $URL2
fi

if [ -d ${name}-${version} ]; then
    rm -rf ${name}-${version}
fi
mkdir ${name}-${version}
cd ${name}-${version}
rpm2cpio ../$source1 | cpio -id
cd -

# install
sudo porg -lp $name-$version 'install -d -m 755 /usr/share/fonts/truetype/twemoji/'
sudo porg -lp+ $name-$version 'cp -p '${name}-${version}'/usr/share/fonts/twemoji/Twemoji.ttf /usr/share/fonts/truetype/twemoji/'
sudo porg -lp+ $name-$version 'install -Dm644 '${source2}' /usr/share/fontconfig/conf.avail/'${source2}

sudo fc-cache /usr/share/fonts/truetype/twemoji/

