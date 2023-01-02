#!/bin/bash
# Description:	Simple tool for viewing MTP devices as FUSE filesystems
# URL:		http://github.com/hanwen/go-mtpfs
# Depends on:	git go libusb-1_0-devel

### variables ###
name=go-mtpfs-git
version=20200111
source1=$name-$version.tar.xz
URL1=https://github.com/hanwen/go-mtpfs.git
commit_hash1='42254b1935eb89625d0c8b61bb8128db2cd3c22f'

### main routine ###
if [ -d $name-$version ]; then
    rm -rf $name-$version
fi

if [ ! -d $name-$version ]; then
    git clone $URL1 $name-$version
fi

# prepare
cd $name-$version
git checkout $commit_hash1

# build
go build ./

# install
sudo porg -lp $name-$version 'install -m 755 go-mtpfs /usr/bin/go-mtpfs'

