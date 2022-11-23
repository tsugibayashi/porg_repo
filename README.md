# porg_repo
Unofficial porg repository

Porg (formerly known as paco), is a program to aid management of software packages installed from source code.

## How to install porg

[Ubuntu]

Install porg with apt.

```
$ sudo apt install porg
```

[Fedora]

Install porg-0.10 manually.

```
$ wget http://downloads.sourceforge.net/porg/porg-0.10.tar.gz
$ tar zxvf porg-0.10.tar.gz
$ cd porg-0.10
$ ./configure --prefix=/usr/local --sysconfdir=/etc --disable-grop
$ make
$ sudo make install
```

### References

* List all installed packages
```
$ porg -a
```

* Show the files included in the package
```
$ porg -f <package_name>
```

* Show the package information
```
$ porg -i <package_name>
```

* Delete the package
```
$ sudo porg -r <package_name>
```

## How to install a package

```
$ git clone https://github.com/tsugibayashi/porg_repo.git
$ cd porg_repo/<package_name>/
$ ./install.sh
```

