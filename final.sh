#!/bin/bash
cd /tmp/rom

. build/envsetup.sh
lunch spark_rosy-userdebug
curl -s https://api.telegram.org/$TG_TOKEN/sendMessage -d chat_id=$TG_CHAT_ID -d "disable_web_page_preview=true" -d "parse_mode=html" -d text="===========================%0A<code>Building SparkOS started..</code>%0A$(echo "${var_cache_report_config}")"
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
mka bacon -j8
curl -s https://api.telegram.org/$TG_TOKEN/sendMessage -d chat_id=$TG_CHAT_ID -d text="Build $(cd /tmp/rom/out/target/product/rosy/ && ls Spark*.zip) Completed!"
