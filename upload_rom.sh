#!/bin/bash

curl -s https://api.telegram.org/$TG_TOKEN/sendMessage -d chat_id=$TG_CHAT_ID -d text="Uploading Build $(cd /tmp/rom/out/target/product/rosy/ && ls OctaviOS*.zip)"
rclone copy /tmp/rom/out/target/product/rosy/OctaviOS*.zip octavios:/home/frs/project/finix-project/Octavi-OS/Experiment -P
curl -s https://api.telegram.org/$TG_TOKEN/sendMessage -d chat_id=$TG_CHAT_ID -d text="Build $(cd /tmp/rom/out/target/product/rosy/ && ls OctaviOS*.zip) Uploaded Successfully!"
curl -s https://api.telegram.org/$TG_TOKEN/sendMessage -d chat_id=$TG_CHAT_ID -d text="Download link https://nfs.jarbull86.workers.dev/rosy/$(cd /tmp/rom/out/target/product/rosy/ && ls OctaviOS*.zip)"
