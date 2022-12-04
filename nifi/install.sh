#!/bin/bash
# Description: An easy to use, powerful, and reliable system to process and distribute data.
# URL:         https://nifi.apache.org/
# Depends on: java-11-openjdk

### variables ###
name=nifi
version=1.19.0
source1=$name-$version-bin.zip
source2=nifi.service
source3=nifi.install
URL1=https://dlcdn.apache.org/$name/$version/$name-$version-bin.zip

### main routine ###
if [ ! -f $source1 ]; then
    wget $URL1
fi
if [ ! -f $source2 ]; then
    echo '[Error] not found '$source2
    exit 1
fi
if [ ! -f $source3 ]; then
    echo '[Error] not found '$source3
    exit 1
fi

if [ -d $name-$version-bin ]; then
    rm -rf $name-$version-bin
fi
unzip $source1

# install
sudo porg -lp $name-$version \
        "mkdir -p /opt/$name /usr/share/doc/$name"

cd $name-$version
sudo porg -lp+ $name-$version "cp -r . /opt/$name/"
sudo porg -lp+ $name-$version "cp -r docs/. /usr/share/doc/$name/"

sudo chmod 0755 /opt/$name/bin/nifi.sh
sudo chmod 0755 /opt/$name/bin/nifi-env.sh
sudo sed -i "s/^run.as=/run.as=nifi/" /opt/$name/conf/bootstrap.conf

sudo porg -lp+ $name-$version \
	"install -Dm 644 ../$source2 /usr/lib/systemd/system/nifi.service"

# post-install
sudo ../$source3

