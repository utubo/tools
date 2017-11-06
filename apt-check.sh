#!/bin/sh

apt-get update
chk=$(apt-get -s upgrade | grep -C 1 以下のパッケージ | grep -v 検出しています)
if [ -z "$chk" ]; then
  if [ -e /var/login_msg.d/apt-check.txt ]; then
    rm /var/login_msg.d/apt-check.txt
  fi
else
  if [ ! -d /var/login_msg.d ]; then
    mkdir -p /var/login_msg.d
  fi
  echo 更新が必要なパッケージがあります。 > /var/login_msg.d/apt-check.txt
  echo "$chk" >> /var/login_msg.d/apt-check.txt
fi

