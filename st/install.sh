#!/bin/bash
# Description: a simple terminal implementation for X
# URL:         http://st.suckless.org/
# Depends on: build-essential dpkg-dev libxft-dev

### variables ###
name=st
version=0.8.5
source1=$name-$version.tar.gz
source2=st.desktop
source3=st.wrapper
patch1=terminfo.patch
config1=config.h
URL_source1=http://dl.suckless.org/st/$name-$version.tar.gz

### main routine ###
if [ ! -f $source1 ]; then
	wget $URL_source1
fi
if [ ! -f $source2 ]; then
	echo '[Error] not found '$source2
	exit 1
fi
if [ ! -f $source3 ]; then
	echo '[Error] not found '$source3
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

# change c99 to cc in config.mk
DISTRO=`lsb_release -a | grep ^Distributor | gawk '{print($3)}'`
if [ $DISTRO = "Solus" ]; then
    sed -i 's/^# CC = c99$/CC = cc/' config.mk
fi

# build
make

# install
sudo porg -lp $name-$version \
	'make PREFIX=/usr MANPREFIX=/usr/share/man install'
sudo porg -lp+ $name-$version \
	"cp -p ../$source2 /usr/share/applications/"
sudo porg -lp+ $name-$version \
	"install -m 755 ../$source3 /usr/bin/$source3"

# Add st.wrapper to x-terminal-emulator
if [ -f /usr/bin/update-alternatives ]; then
    sudo update-alternatives --install /usr/bin/x-terminal-emulator x-terminal-emulator /usr/bin/st.wrapper 10
fi

