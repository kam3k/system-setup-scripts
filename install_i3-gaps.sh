#!/bin/bash

# This script downloads, configures, and builds i3-gaps,
# the fork of i3 that allows for gaps between windows

# First, install the build dependencies
apt-get install -y git make gcc checkinstall autoconf
apt-get install -y libxcb1-dev libxcb-keysyms1-dev libpango1.0-dev libxcb-util0-dev libxcb-icccm4-dev libyajl-dev libstartup-notification0-dev libxcb-randr0-dev libev-dev libxcb-cursor-dev libxcb-xinerama0-dev libxcb-xkb-dev libxkbcommon-dev libxkbcommon-x11-dev

# We need a package from a PPA when building on Ubuntu 16.04
add-apt-repository -y ppa:aguignard/ppa
apt-get update
apt-get install -y libxcb-xrm-dev

# Useful packages to use with i3:
apt-get install -y i3lock i3status feh suckless-tools compton

INSTALL_PREFIX=/usr/local

# Get the source:
if [ ! -d ${INSTALL_PREFIX}/src/i3-gaps ]; then
  mkdir -p ${INSTALL_PREFIX}/src
  git clone https://www.github.com/Airblader/i3 ${INSTALL_PREFIX}/src/i3-gaps
fi

cd ${INSTALL_PREFIX}/src/i3-gaps
git pull
autoreconf --force --install
rm -rf build
mkdir -p build && cd build

# Disabling sanitizers is important for release versions!
# The prefix and sysconfdir are, obviously, dependent on the distribution.
../configure --prefix=/usr --sysconfdir=/etc --disable-sanitizers
make && checkinstall -D -y --pkgname i3-gaps --pkgversion 4.15 --pkggroup x11 make install
