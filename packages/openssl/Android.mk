LOCAL_PATH := $(call my-dir)
VAULT_PATH := ../../vault/hemroot/$(TARGET_ARCH_ABI)

# crypto
include $(CLEAR_VARS)

LOCAL_MODULE        := crypto_$(TARGET_ARCH_ABI)
LOCAL_SRC_FILES     := $(VAULT_PATH)/lib/libcrypto.a
LOCAL_EXPORT_CFLAGS := -I$(LOCAL_PATH)/$(VAULT_PATH)/include/openssl

include $(PREBUILT_STATIC_LIBRARY)

# ssl
include $(CLEAR_VARS)

LOCAL_MODULE        := ssl_$(TARGET_ARCH_ABI)
LOCAL_SRC_FILES     := $(VAULT_PATH)/lib/libssl.a
LOCAL_EXPORT_CFLAGS := -I$(LOCAL_PATH)/$(VAULT_PATH)/include/openssl

include $(PREBUILT_STATIC_LIBRARY)