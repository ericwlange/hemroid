LOCAL_PATH := $(call my-dir)
VAULT_PATH := ../../vault/hemroot/$(TARGET_ARCH_ABI)

# libpng
include $(CLEAR_VARS)

LOCAL_MODULE        := libpng
LOCAL_SRC_FILES     := $(VAULT_PATH)/lib/libpng16.so
LOCAL_EXPORT_CFLAGS := -I$(LOCAL_PATH)/$(VAULT_PATH)/include/libpng16
LOCAL_EXPORT_LDLIBS     := -L$(LOCAL_PATH)/$(VAULT_PATH)/lib -lpng16
$(LOCAL_MODULE):
	$(shell mkdir -p src/main/java/org/liquidplayer/hemroid)
	$(shell cp -r $(LOCAL_PATH)/../libpng/java/PNG.java src/main/java/org/liquidplayer/hemroid)
$(LOCAL_MODULE)_JavaInterface:
	$(eval EXPORT_JAVA_INTERFACE += new PNG(context);)
$(LOCAL_PATH)/$(LOCAL_SRC_FILES):
	$(LOCAL_PATH)/../../hemroid install --abi=$(TARGET_ARCH_ABI) libpng
libraries: $(LOCAL_PATH)/$(LOCAL_SRC_FILES)

include $(LOCAL_PATH)/../hemroid/prebuilt-shared-library.mk
