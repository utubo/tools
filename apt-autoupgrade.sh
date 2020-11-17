#!/bin/sh

apt update
apt -y dist-upgrade
apt autoclean
apt -y autoremove
if [ -e /var/login_msg.d/apt-check.txt ]; then
  rm /var/login_msg.d/apt-check.txt
fi

