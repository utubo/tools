#!/bin/sh

apt-get update
apt-get -y dist-upgrade
apt-get autoclean
apt-get autoremove
if [ -e /var/login_msg.d/apt-check.txt ]; then
  rm /var/login_msg.d/apt-check.txt
fi

