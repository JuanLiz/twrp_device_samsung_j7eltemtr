# Samsung Exynos boot images: Android header v0 with the DTBH blob in the DT
# section and a SEANDROIDENFORCE footer. Requires a mkbootimg with --dt support.

ifneq ($(strip $(INSTALLED_BOOTIMAGE_TARGET)),)
$(INSTALLED_BOOTIMAGE_TARGET): $(MKBOOTIMG) $(INTERNAL_BOOTIMAGE_FILES) $(TARGET_PREBUILT_DTB)
	$(call pretty,"Target boot image: $@")
	$(hide) $(MKBOOTIMG) $(INTERNAL_BOOTIMAGE_ARGS) $(INTERNAL_MKBOOTIMG_VERSION_ARGS) $(BOARD_MKBOOTIMG_ARGS) --dt $(TARGET_PREBUILT_DTB) --output $@
	$(hide) echo -n "SEANDROIDENFORCE" >> $@
	$(hide) $(call assert-max-image-size,$@,$(BOARD_BOOTIMAGE_PARTITION_SIZE))
endif

$(INSTALLED_RECOVERYIMAGE_TARGET): $(MKBOOTIMG) $(recoveryimage-deps) $(TARGET_PREBUILT_DTB)
	$(call pretty,"Target recovery image: $@")
	$(hide) $(MKBOOTIMG) $(INTERNAL_RECOVERYIMAGE_ARGS) $(INTERNAL_MKBOOTIMG_VERSION_ARGS) $(BOARD_MKBOOTIMG_ARGS) --dt $(TARGET_PREBUILT_DTB) --output $@
	$(hide) echo -n "SEANDROIDENFORCE" >> $@
	$(hide) $(call assert-max-image-size,$@,$(BOARD_RECOVERYIMAGE_PARTITION_SIZE))
