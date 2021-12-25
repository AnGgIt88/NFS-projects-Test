#!/bin/bash

cd /tmp

curl -s https://api.telegram.org/$TG_TOKEN/sendMessage -d chat_id=$TG_CHAT_ID -d text="Compres ccache"
com ()
{
    tar --use-compress-program="pigz -k -$2 " -cf $1.tar.gz $1
}

time com ccache 1

cd /tmp
curl -s https://api.telegram.org/$TG_TOKEN/sendMessage -d chat_id=$TG_CHAT_ID -d text="Uploading ccache...."
rclone copy ccache.tar.gz octavios:/home/frs/project/ccache/Octavi -P
