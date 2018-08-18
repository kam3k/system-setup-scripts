#!/bin/bash

if [[ -a $(which insect) ]]; then
  echo "insect is already installed."
  exit 0
fi

if [[ ! -a $(which curl) ]]; then
  echo "Error: curl is not installed. Please install curl first."
  exit 1
fi

INSECT_VERSION=5.0.0
INSTALL_LOCATION=/usr/local/bin

curl -fLo ${INSTALL_LOCATION}/insect https://github.com/sharkdp/insect/releases/download/v${INSECT_VERSION}/insect-linux-x64
cd ${INSTALL_LOCATION}
chmod +x insect
