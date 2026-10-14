# TWRP for Samsung Galaxy J7 2015 T-Mobile / MetroPCS (SM-J700T / SM-J700T1)
$(call inherit-product, $(SRC_TARGET_DIR)/product/base.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/emulated_storage.mk)
$(call inherit-product, vendor/twrp/config/common.mk)

PRODUCT_DEVICE       := j7eltemtr
PRODUCT_NAME         := twrp_j7eltemtr
PRODUCT_BRAND        := samsung
PRODUCT_MODEL        := SM-J700T1
PRODUCT_MANUFACTURER := samsung
PRODUCT_RELEASE_NAME := Samsung Galaxy J7 2015 T-Mobile/MetroPCS
TARGET_VENDOR        := samsung

# This kernel (3.10) has no FunctionFS AIO: adbd must use the compat path
PRODUCT_PROPERTY_OVERRIDES += \
    persist.adb.nonblocking_ffs=0 \
    ro.adb.nonblocking_ffs=0 \
    sys.usb.ffs.aio_compat=1
