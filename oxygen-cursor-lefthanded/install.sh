#!/bin/bash
# Description: Oxygen White Left Handed
# URL: http://gnome-look.org/content/show.php?action=content&content=165028

### variables ###
name=oxygen-cursor-lefthanded
version=1.00.01
source=165028-OxygenWhiteLH.tgz
directory=OxygenWhiteLH

### main routine ###
if [ -d $directory ]; then
	rm -rf $directory
fi
tar zxf $source

sudo install -d /usr/share/icons/oxygenwhitelh
cd $directory
sudo porg -lp $name-$version 'cp -R * /usr/share/icons/oxygenwhitelh'

