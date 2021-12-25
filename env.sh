#!/bin/bash

export DEBIAN_FRONTEND=noninteractive
export ALLOW_MISSING_DEPENDENCIES=true
apt update
apt install sudo
mkdir -p ~/.config/rclone
echo "$rcloneconfig" > ~/.config/rclone/rclone.conf
DEBIAN_FRONTEND=noninteractive
sudo apt install python3 -y
sudo ln -sf /usr/bin/python3 /usr/bin/python
git config --global user.name "NFS86"
git config --global user.email "jarbull86@gmail.com"
mkdir -p /tmp/ccache
rclone copy octavios:/home/frs/project/ccache/Octavi/ccache.tar.gz /tmp -P
cd /tmp
time tar xf ccache.tar.gz
cd /tmp
