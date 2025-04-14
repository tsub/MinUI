#!/bin/sh
. /etc/profile

PLATFORM="gkdpixel2"
SDCARD_PATH="/storage/roms/minui"
UPDATE_PATH="$SDCARD_PATH/MinUI.zip"
SYSTEM_PATH="$SDCARD_PATH/.system"
IMAGE_PATH="$SDCARD_PATH/gkdpixel2/assets"
LAUNCH_PATH="$SYSTEM_PATH/$PLATFORM/paks/MinUI.pak/launch.sh"

echo performance > ${CPU_FREQ}/scaling_governor
# install/update
if [ -f "$UPDATE_PATH" ]; then 
	if [ -d "$SYSTEM_PATH" ]; then
		ply-image $IMAGE_PATH/updating.png
	else
		ply-image $IMAGE_PATH/installing.png
	fi
	
	unzip -o "$UPDATE_PATH" -d "$SDCARD_PATH" # &> $SDCARD_PATH/unzip.txt
	rm -f "$UPDATE_PATH"
	
	cat /dev/zero > /dev/fb0
fi
# no MinUI files detected
if [ ! -f "$LAUNCH_PATH" ]; then
	ply-image $IMAGE_PATH/missing.png
	sleep 1000
	# poweroff
fi
# launch it
while [ -f "$LAUNCH_PATH" ] ; do
	"$LAUNCH_PATH"
done
