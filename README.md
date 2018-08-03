## system-setup-scripts

This repository contains scripts that are used to install system utilities that
I use regularly. Some are installed through the package manager, and others are
downloaded and built from source by the scripts. Currently, these scripts work
and are tested on Ubuntu 16.04.

### Installation

All tools may be installed with the following command, run as root. (Note: Do
not execute anything as root unless you know where it's from and trust what it
will do)

```shell
bash -c "$(wget https://raw.githubusercontent.com/kam3k/system-setup-scripts/master/tools/setup.sh -O -)"
```

### Acknowledgements

Thanks to John Daly for many/most of these scripts, which I modified for my own use.
