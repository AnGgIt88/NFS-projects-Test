#!/bin/bash

cd /tmp/rom
repo init -q --no-repo-verify --depth=1 -u https://github.com/Spark-Rom/manifest -b spark -g default,-mips,-darwin,-notdefault
git clone https://github.com/NFS86/local_manifest --depth 1 -b aex-12 .repo/local_manifests
repo sync -c --no-clone-bundle --no-tags --optimized-fetch --prune --force-sync -j8
