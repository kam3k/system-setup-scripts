#!/bin/bash

if [[ -a $(which fd) ]]; then
  echo "fd is already installed."
  exit 0
fi

if [[ ! -a $(which curl) ]]; then
  echo "Error: curl is not installed. Please install curl first."
  exit 1
fi

FD_VERSION=7.0.0

curl -fLo /tmp/fd.deb https://github.com/sharkdp/fd/releases/download/v${FD_VERSION}/fd-musl_${FD_VERSION}_amd64.deb
cd /tmp
dpkg -i fd.deb
