# porg_repo
Unofficial porg repository

Porg (formerly known as paco), is a program to aid management of software packages installed from source code.

## How to install porg

[Ubuntu]

```
$ sudo apt install porg
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

