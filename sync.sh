#!/bin/bash

cd /tmp/rom
repo init -q --no-repo-verify --depth=1 -u https://github.com/Octavi-OS/platform_manifest.git -b 12 -g default,-mips,-darwin,-notdefault
git clone https://github.com/NFS86/local_manifest --depth 1 -b OctaviOS-12 .repo/local_manifests
repo sync -c --no-clone-bundle --no-tags --optimized-fetch --prune --force-sync -j8
