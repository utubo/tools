#!/bin/sh

apt-get update
if apt-get -s upgrade | grep 'アップグレード: 0 個、新規インストール: 0 個、削除: 0 個、保留: 0 個。'; then
  if [ -e /var/login_msg.d/apt-check.txt ]; then
    rm /var/login_msg.d/apt-check.txt
  fi
else
  if [ ! -d /var/login_msg.d ]; then
    mkdir -p /var/login_msg.d
  fi
  echo 更新が必要なパッケージがあります。 > /var/login_msg.d/apt-check.txt
fi

