#!/bin/bash

# This script is used to install a series of packages that
# I consider essential for me to have on a Linux computer.

apt-get update

apt-get install -y \
  rxvt-unicode-256color \
  gawk \
  git \
  htop \
  openssh-server \
  zsh \
  autossh \
  curl \
  cifs-utils \
  xsel \
  silversearcher-ag \
  stow \
  nmap \
  unzip \
  feh \
  dunst \
  tree
