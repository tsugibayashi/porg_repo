#!/bin/bash
# Description: a simple terminal implementation for X
# URL:         http://st.suckless.org/
# Depends on: build-essential dpkg-dev libxft-dev

### variables ###
name=st
version=0.8.5
source1=$name-$version.tar.gz
source2=st.desktop
patch1=terminfo.patch
config1=config.h
URL1=http://dl.suckless.org/st/$name-$version.tar.gz

### main routine ###
if [ ! -f $source1 ]; then
	wget $URL1
fi
if [ ! -f $source2 ]; then
	echo '[Error] not found '$source2
	exit 1
fi
if [ ! -f $patch1 ]; then
	echo '[Error] not found '$patch1
	exit 1
fi
if [ ! -f $config1 ]; then
	echo '[Error] not found '$config1
	exit 1
fi

if [ -d $name-$version ]; then
	rm -rf $name-$version
fi
tar zxvf $source1

# patch
patch --directory=$name-$version --strip=1 < $patch1

# copy the config1 to source
cp $config1 $name-$version/

cd $name-$version
make

# install
sudo porg -lp $name-$version \
	'make PREFIX=/usr MANPREFIX=/usr/share/man install'
sudo porg -lp+ $name-$version \
	"cp -p ../$source2 /usr/share/applications/"
