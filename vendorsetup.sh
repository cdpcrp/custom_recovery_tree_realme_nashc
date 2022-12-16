FDEVICE="nashc"
#set -o xtrace

fox_get_target_device() {
local chkdev=$(echo "$BASH_SOURCE" | grep -w $FDEVICE)
   if [ -n "$chkdev" ]; then
      FOX_BUILD_DEVICE="$FDEVICE"
   else
      chkdev=$(set | grep BASH_ARGV | grep -w $FDEVICE)
      [ -n "$chkdev" ] && FOX_BUILD_DEVICE="$FDEVICE"
   fi
}

if [ -z "$1" -a -z "$FOX_BUILD_DEVICE" ]; then
   fox_get_target_device
fi

if [ "$1" = "$FDEVICE" -o "$FOX_BUILD_DEVICE" = "$FDEVICE" ]; then
	# Initial Exports
	export ALLOW_MISSING_DEPENDENCIES=true
    export FOX_USE_TWRP_RECOVERY_IMAGE_BUILDER=1
    export LC_ALL="C"

	# Maintaining Info
	export OF_MAINTAINER=Crypton
	export FOX_VERSION=$(date +%y.%m.%d)
	export FOX_BUILD_TYPE=Unofficial-Beta
	
	# Device Information
	export FOX_ARCH=arm64
	export FOX_VARIANT="A12.1"
	export TARGET_DEVICE_ALT="RMX3085,RMX3085.ossi,qssi,oppo6785,RMX3085L1"

	# Funtions
	export FOX_REPLACE_BUSYBOX_PS=1
	export FOX_REPLACE_TOOLBOX_GETPROP=1
	export FOX_USE_TAR_BINARY=1
	export FOX_USE_SED_BINARY=1
	export FOX_USE_BASH_SHELL=1
	export FOX_ASH_IS_BASH=1
	export FOX_USE_GREP_BINARY=1
	export FOX_USE_XZ_UTILS=1
	export FOX_USE_NANO_EDITOR=1
	export OF_ENABLE_LPTOOLS=1

	# Display Settings
	export OF_SCREEN_H=2340
	export OF_STATUS_H=120
	export OF_STATUS_INDENT_LEFT=150
	export OF_STATUS_INDENT_RIGHT=20
	export OF_HIDE_NOTCH=1
	export OF_CLOCK_POS=1
	export OF_ALLOW_DISABLE_NAVBAR=0

	# Partitions Handling
	export FOX_RECOVERY_INSTALL_PARTITION="/dev/block/by-name/recovery"
	export FOX_RECOVERY_SYSTEM_PARTITION="/dev/block/mapper/system"
	export FOX_RECOVERY_VENDOR_PARTITION="/dev/block/mapper/vendor"
	export FOX_RECOVERY_BOOT_PARTITION="/dev/block/by-name/boot"

	# Other OrangeFox Vars
	export OF_DONT_PATCH_ENCRYPTED_DEVICE=1
	export OF_DONT_PATCH_ON_FRESH_INSTALLATION=1
	export OF_KEEP_DM_VERITY_FORCED_ENCRYPTION=1
	export OF_SKIP_DECRYPTED_ADOPTED_STORAGE=1
	export OF_FIX_DECRYPTION_ON_DATA_MEDIA=1
	export OF_OTA_RES_DECRYPT=1
	export OF_SUPPORT_ALL_BLOCK_OTA_UPDATES=1
	export OF_FIX_OTA_UPDATE_MANUAL_FLASH_ERROR=1
	export OF_NO_RELOAD_AFTER_DECRYPTION=1
	export FOX_BUGGED_AOSP_ARB_WORKAROUND="1546300800"; # Tuesday, January 1, 2019 12:00:00 AM GMT+00:00
	export OF_PATCH_AVB20=1
	export OF_NO_SPLASH_CHANGE=1
	export OF_PATCH_VBMETA_FLAG=2
	
	# let's see what are our build VARs
	if [ -n "$FOX_BUILD_LOG_FILE" -a -f "$FOX_BUILD_LOG_FILE" ]; then
		export | grep "FOX" >> $FOX_BUILD_LOG_FILE
		export | grep "OF_" >> $FOX_BUILD_LOG_FILE
		export | grep "TARGET_" >> $FOX_BUILD_LOG_FILE
		export | grep "TW_" >> $FOX_BUILD_LOG_FILE
	fi
fi
#
