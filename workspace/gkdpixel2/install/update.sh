#!/bin/sh

# becomes /.system/gkdpixel2/bin/install.sh

# clean up from an previous ill-considered update
DTB_PATH=/storage/TF2/.system/gkdpixel2/dat/rk3562-magicx-linux.dtb
if [ -f "$DTB_PATH" ]; then
	rm -rf "$DTB_PATH"
fi

