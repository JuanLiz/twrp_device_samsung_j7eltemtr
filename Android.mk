ifneq ($(filter j7eltemtr,$(TARGET_DEVICE)),)
LOCAL_PATH := device/samsung/j7eltemtr
include $(call all-makefiles-under,$(LOCAL_PATH))
endif
