# TWRP BoardConfig for j7eltemtr (SM-J700T1) / j7eltetmo (SM-J700T) - Exynos 7580
LOCAL_PATH := device/samsung/j7eltemtr
TARGET_OTA_ASSERT_DEVICE := j7eltemtr,j7eltetmo

# Architecture: 32-bit userspace on an arm64 kernel (as stock and LineageOS)
TARGET_ARCH                  := arm
TARGET_ARCH_VARIANT          := armv8-a
TARGET_CPU_ABI               := armeabi-v7a
TARGET_CPU_ABI2              := armeabi
TARGET_CPU_VARIANT           := cortex-a53
TARGET_CPU_SMP               := true
TARGET_KERNEL_ARCH           := arm64
TARGET_KERNEL_HEADER_ARCH    := arm64
TARGET_USES_64_BIT_BINDER    := true

# Platform
TARGET_BOARD_PLATFORM        := exynos5
TARGET_SOC                   := exynos7580
TARGET_BOOTLOADER_BOARD_NAME := universal7580
TARGET_NO_BOOTLOADER         := true
TARGET_NO_RADIOIMAGE         := true

# Kernel: prebuilt Image and Samsung DTBH blob from the LineageOS j7eltemtr build
TARGET_PREBUILT_KERNEL   := $(LOCAL_PATH)/prebuilt/Image
TARGET_PREBUILT_DTB      := $(LOCAL_PATH)/prebuilt/dt.img
BOARD_KERNEL_IMAGE_NAME  := Image
BOARD_KERNEL_CMDLINE     := buildvariant=eng
BOARD_KERNEL_BASE        := 0x10000000
BOARD_KERNEL_PAGESIZE    := 2048
BOARD_KERNEL_TAGS_OFFSET := 0x00000100
BOARD_RAMDISK_OFFSET     := 0x01000000
BOARD_MKBOOTIMG_ARGS     := --ramdisk_offset 0x01000000 --tags_offset 0x00000100

# Partitions (sizes from the SM-J700T1 PIT)
BOARD_BOOTIMAGE_PARTITION_SIZE     := 33554432
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 39845888
BOARD_SYSTEMIMAGE_PARTITION_SIZE   := 3254779904
BOARD_USERDATAIMAGE_PARTITION_SIZE := 11924406272
BOARD_CACHEIMAGE_PARTITION_SIZE    := 209715200
BOARD_FLASH_BLOCK_SIZE             := 4096
BOARD_HAS_LARGE_FILESYSTEM         := true
TARGET_USERIMAGES_USE_EXT4         := true
TARGET_USERIMAGES_USE_F2FS         := true
BOARD_SUPPRESS_SECURE_ERASE        := true
TARGET_COPY_OUT_VENDOR             := vendor
TARGET_COPY_OUT_PRODUCT            := product
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_PRODUCTIMAGE_FILE_SYSTEM_TYPE := ext4

# Recovery
TARGET_RECOVERY_FSTAB            := $(LOCAL_PATH)/recovery/recovery.fstab
# DECON framebuffer byte order
TARGET_RECOVERY_PIXEL_FORMAT     := "ABGR_8888"
RECOVERY_GRAPHICS_USE_LINELENGTH := true
RECOVERY_SDCARD_ON_DATA          := true
BOARD_HAS_NO_REAL_SDCARD         := true
TW_THEME                         := portrait_hdpi
TW_BRIGHTNESS_PATH               := "/sys/devices/14800000.dsim/backlight/panel/brightness"
TW_MAX_BRIGHTNESS                := 255
TW_DEFAULT_BRIGHTNESS            := 162
TW_NO_REBOOT_BOOTLOADER          := true
TW_HAS_DOWNLOAD_MODE             := true
TW_EXCLUDE_DEFAULT_USB_INIT      := true
TW_INCLUDE_NTFS_3G               := true
TW_EXTRA_LANGUAGES               := true
TW_EXCLUDE_SUPERSU               := true
TW_EXCLUDE_NANO                  := true
TW_EXCLUDE_BASH                  := true
TW_INCLUDE_CRYPTO                := false
TW_USE_TOOLBOX                   := true
