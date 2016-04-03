LOCAL_PATH := $(call my-dir)
VAULT_PATH := ../../vault/hemroot/$(TARGET_ARCH_ABI)

include $(CLEAR_VARS)

LOCAL_MODULE        := pixman
LOCAL_SRC_FILES     := $(VAULT_PATH)/lib/libpixman-1.so
LOCAL_EXPORT_CFLAGS := -I$(LOCAL_PATH)/$(VAULT_PATH)/include/pixman-1
LOCAL_EXPORT_LDLIBS := -L$(LOCAL_PATH)/$(VAULT_PATH)/lib -lpixman-1
$(LOCAL_MODULE):
	$(shell mkdir -p src/main/java/org/liquidplayer/hemroid)
	$(shell cp -r $(LOCAL_PATH)/../pixman/java/Pixman.java src/main/java/org/liquidplayer/hemroid)
$(LOCAL_PATH)/$(LOCAL_SRC_FILES):
	$(LOCAL_PATH)/../../hemroid install --abi=$(TARGET_ARCH_ABI) pixman
libraries: $(LOCAL_PATH)/$(LOCAL_SRC_FILES)

include $(LOCAL_PATH)/../hemroid/prebuilt-shared-library.mk
