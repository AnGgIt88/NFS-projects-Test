#!/bin/bash
cd /tmp/rom

. build/envsetup.sh
lunch octavi_rosy-userdebug
curl -s https://api.telegram.org/$TG_TOKEN/sendMessage -d chat_id=$TG_CHAT_ID -d "disable_web_page_preview=true" -d "parse_mode=html" -d text="===========================%0A<code>Building ccache started..</code>%0A$(echo "${var_cache_report_config}")"
export CCACHE_DIR=/tmp/ccache
export CCACHE_EXEC=$(which ccache)
export USE_CCACHE=1
ccache -M 20G
ccache -o compression=true
ccache -z
export ALLOW_MISSING_DEPENDENCIES=true
export TZ=Asia/Jakarta
export BUILD_USERNAME=finix
export BUILD_HOSTNAME=rosy
export WITH_GAPPS=false
brunch rosy -j8 &
sleep 90m
kill %1
ccache -s
