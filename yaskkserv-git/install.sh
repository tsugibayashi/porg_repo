#!/bin/bash
# Description:	Yet Another SKK Japanese input method dictionary server
# URL:		http://umiushi.org/~wac/yaskkserv/
# Depends on:	git perl openssl skkdic
# Optional:     ccache

### functions ###
function prepare() {
    local username=`whoami`
    if [ ! -f $source2.bak ]; then
        cp -p -v $source2 $source2.bak
    fi
    sed -i "s/nobody$/$username/" $source2
}

### variables ###
name=yaskkserv
version=1.1.1.a8306b1
source1=$name-$version.tar.xz
source2=yaskkserv.service
source3=yaskkserv.socket
URL1=https://github.com/wachikun/${name}.git
commit_hash1='a8306b1412ca54e280d791e26133098822826443'

### main routine ###
if [ -d $name-$version ]; then
    rm -rf $name-$version
fi

if [ ! -d $name-$version ]; then
    git clone $URL1 $name-$version
fi

# prepare
prepare
cd $name-$version
git checkout $commit_hash1

# build
LC_ALL=C ./configure --prefix=/usr --enable-google-japanese-input \
        --enable-google-suggest --disable-gnutls --enable-openssl
make

# create the dictionary for yaskkserv
for i in /usr/share/skk/SKK-JISYO.L \
         /var/lib/flatpak/runtime/org.fcitx.Fcitx5.Addon.Skk/x86_64/master/active/files/share/skk/SKK-JISYO.L; do
    if [ -f $i ]; then
        echo '[Info] SKK-JISYO.L is found: '$i
        SKK_JISYO_L=$i
        break
    fi
done
if [ ! ${SKK_JISYO_L} ]; then
    echo '[Error] file not found: SKK-JISYO.L'
    exit 1
fi

var/bsd_cygwin_linux_gcc/release/yaskkserv_make_dictionary/yaskkserv_make_dictionary ${SKK_JISYO_L} SKK-JISYO.L.yaskkserv

# install
sudo porg -lp $name-$version \
	'install -m 755 var/bsd_cygwin_linux_gcc/release/yaskkserv_make_dictionary/yaskkserv_make_dictionary /usr/bin/yaskkserv_make_dictionary'
sudo porg -lp+ $name-$version \
	'install -m 755 var/bsd_cygwin_linux_gcc/release/yaskkserv_simple/yaskkserv_simple /usr/bin/yaskkserv_simple'
sudo porg -lp+ $name-$version \
	'install -m 755 var/bsd_cygwin_linux_gcc/release/yaskkserv_normal/yaskkserv_normal /usr/bin/yaskkserv_normal'
sudo porg -lp+ $name-$version \
	'install -m 755 var/bsd_cygwin_linux_gcc/release/yaskkserv_hairy/yaskkserv_hairy /usr/bin/yaskkserv_hairy'

if [ ! -d /usr/share/skk ]; then
    sudo porg -lp+ $name-$version 'install -d -m 755 /usr/share/skk/'
fi
sudo porg -lp+ $name-$version 'install -m 644 SKK-JISYO.L.yaskkserv /usr/share/skk/'

sudo porg -lp+ $name-$version "install -m 644 ../${source2} /usr/lib/systemd/system/"
sudo porg -lp+ $name-$version "install -m 644 ../${source3} /usr/lib/systemd/system/"

