#!/bin/bash

# This script is used to install a series of packages that
# I consider essential for me to have on a Linux computer.

apt-get install -y python-software-properties \
  git \
  htop \
  openssh-server \
  tmux \
  zsh \
  autossh \
  curl \
  cifs-utils \
  xsel \
  silversearcher-ag \
  stow \
  nmap \
  lxappearance \
  vlc \
  unzip
