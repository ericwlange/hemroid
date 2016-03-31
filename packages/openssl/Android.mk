LOCAL_PATH := $(call my-dir)

# crypto
include $(CLEAR_VARS)

LOCAL_MODULE        := crypto
LOCAL_SRC_FILES     := ../../$(TARGET_ARCH_ABI)/lib/libcrypto.a
LOCAL_EXPORT_CFLAGS := -I$(LOCAL_PATH)/../../$(TARGET_ARCH_ABI)/include/openssl

include $(PREBUILT_STATIC_LIBRARY)

# ssl
include $(CLEAR_VARS)

LOCAL_MODULE        := ssl
LOCAL_SRC_FILES     := ../../$(TARGET_ARCH_ABI)/lib/libssl.a
LOCAL_EXPORT_CFLAGS := -I$(LOCAL_PATH)/../../$(TARGET_ARCH_ABI)/include/openssl

include $(PREBUILT_STATIC_LIBRARY)