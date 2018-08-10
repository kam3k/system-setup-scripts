#!/bin/bash

# This script downloads, builds, and installs rtags

# install the required build dependencies:
CLANG_VERSION=6.0
apt-get update
apt-get install -y cmake ninja-build clang-${CLANG_VERSION} libclang-${CLANG_VERSION}-dev libclang-common-${CLANG_VERSION}-dev libclang1-${CLANG_VERSION} libllvm${CLANG_VERSION} libncurses5-dev libssl-dev git g++ libc++-dev libc++abi-dev

INSTALL_PREFIX=/usr/local

# Get the source:
if [ ! -d ${INSTALL_PREFIX}/src/rtags ]; then
  mkdir -p ${INSTALL_PREFIX}/src/rtags
  cd ${INSTALL_PREFIX}/src
  git clone https://github.com/Andersbakken/rtags.git
  cd ${INSTALL_PREFIX}/src/rtags
  git submodule init
  mkdir -p ${INSTALL_PREFIX}/src/rtags/build
fi

cd ${INSTALL_PREFIX}/src/rtags
git pull
git submodule update --init --recursive
cd ${INSTALL_PREFIX}/src/rtags/build

# Build and install the source:
CXX=clang++-${CLANG_VERSION} cmake -GNinja -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=${INSTALL_PREFIX} -DLIBCLANG_LLVM_CONFIG_EXECUTABLE=/usr/bin/llvm-config-${CLANG_VERSION} .. && ninja install

