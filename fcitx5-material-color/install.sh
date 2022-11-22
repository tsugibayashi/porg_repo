#!/bin/bash
# Description: Material color theme for fcitx5
# URL: https://github.com/hosxy/Fcitx5-Material-Color
# Depends on:

### variables ###
name=fcitx5-material-color
version=0.2.1
source=${name}-${version}.tar.gz
URL=https://github.com/hosxy/Fcitx5-Material-Color/archive/${version}/${source}

### main routine ###
if [ ! -f $source ]; then
    wget $URL
fi

if [ -d Fcitx5-Material-Color-$version ]; then
	rm -rf Fcitx5-Material-Color-$version
fi
tar zxvf $source

cd Fcitx5-Material-Color-$version

# install
sudo porg -lp $name-$version "install -Dm644 arrow.png radio.png -t /usr/share/$name/"

for _variant in black blue brown deepPurple indigo orange pink red sakuraPink teal; do
    _variant_name=Material-Color-${_variant^}

    sed -i "s/^Name=.*/Name=$_variant_name/" theme-$_variant.conf
    sudo porg -lp+ $name-$version "install -Dm644 theme-$_variant.conf /usr/share/fcitx5/themes/$_variant_name/theme.conf"

    # Create symbolic links
    sudo porg -lp+ $name-$version "ln -s ../../../$name/arrow.png /usr/share/fcitx5/themes/$_variant_name/"
    sudo porg -lp+ $name-$version "ln -s ../../../$name/radio.png /usr/share/fcitx5/themes/$_variant_name/"
done

