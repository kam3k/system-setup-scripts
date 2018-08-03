#!/bin/bash

# This script is used to install a series of tools that
# I use for software development

apt-get install -y g++ \
  libclang-6.0-dev \
  ccache \
  distcc \
  doxygen \
  libpython-dev \
  cppcheck \
  cmake \
  cmake-curses-gui \
  make \
  ninja-build \
  build-essential
