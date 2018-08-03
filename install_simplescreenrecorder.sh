#!/bin/bash

# This script sets up a PPA and installs
# SimpleScreenRecorder.

# See if vim is already installed:
if hash simplescreenrecorder 2>/dev/null; then
  echo "SimpleScreenRecorder already installed"
  exit 0
fi

add-apt-repository -y ppa:maarten-baert/simplescreenrecorder
apt-get update
apt-get install -y simplescreenrecorder
