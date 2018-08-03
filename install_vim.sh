#!/bin/bash

# This script sets up a PPA and installs
# vim.

# See if vim is already installed:
if hash vim 2>/dev/null; then
  echo "Vim already installed"
  exit 0
fi

add-apt-repository -y ppa:jonathonf/vim
apt-get update
apt-get install -y vim-gtk

# This dependency is require for using the system clipboard:
apt-get install -y xsel
