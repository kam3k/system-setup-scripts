#!/bin/bash

# This script downloads, configures, and builds rofi,
# a window launcher that can be used with i3 instead of
# demnu

# NOTE: As of May, 2018, I have not got a working script
# to build rofi from source. However, it is now in the Ubuntu
# repos, so I will be installing from there for now.

# First, install the build dependencies
apt-get install -y git make gcc checkinstall autoconf automake pkg-config
apt-get install -y libxinerama-dev libxft-dev libpango1.0-dev libcairo2-dev libpangocairo-1.0-0 libglib2.0-dev libx11-dev libstartup-notification0-dev libxcb-ewmh-dev libxcb-ewmh2 libx11-xcb-dev xutils-dev

INSTALL_PREFIX=/usr/local

# Airblader has a library that is a dependency of rofi. Install
# that now:
if [ ! -d ${INSTALL_PREFIX}/src/xcb-util-xrm ]; then
  mkdir -p ${INSTALL_PREFIX}/src
  cd ${INSTALL_PREFIX}/src
  git clone --recursive https://github.com/Airblader/xcb-util-xrm.git
  cd xcb-util-xrm
  ./autogen.sh
  ./configure
  make && make install
fi

# Get the source:
if [ ! -d ${INSTALL_PREFIX}/src/rofi ]; then
  mkdir -p ${INSTALL_PREFIX}/src
  cd ${INSTALL_PREFIX}/src
  git clone https://github.com/DaveDavenport/rofi.git
fi

ROFI_VERSION=1.1.0
cd ${INSTALL_PREFIX}/src/rofi
git submodule update --init
autoreconf -i
mkdir -p build && cd build
../configure
make && checkinstall -D -y --pkgname rofi --pkgversion ${ROFI_VERSION} --pkggroup x11 make install
