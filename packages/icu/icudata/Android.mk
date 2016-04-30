# icudata
LOCAL_PATH := $(call my-dir)
VAULT_PATH := $(LOCAL_PATH)/../../../vault/hemroot/$(TARGET_ARCH_ABI)
include $(CLEAR_VARS)

LOCAL_MODULE        	:= icudata_$(TARGET_ARCH_ABI)
LOCAL_SRC_FILES     	:= $(VAULT_PATH)/lib/libicuhemdata.so
LOCAL_SHARED_LIBRARIES  := icudata_$(TARGET_ARCH_ABI)
LOCAL_EXPORT_CFLAGS 	:= -I$(LOCAL_PATH)/$(VAULT_PATH)/include
LOCAL_EXPORT_LDLIBS     := -L$(LOCAL_PATH)/$(VAULT_PATH)/lib -licuhemdata
$(LOCAL_MODULE)_JavaInterface:
	$(eval EXPORT_JAVA_INTERFACE += new ICUData(context);)
$(LOCAL_PATH)/$(LOCAL_SRC_FILES):
	hemroid install --abi=$(TARGET_ARCH_ABI) icu
libraries: $(LOCAL_PATH)/$(LOCAL_SRC_FILES)

include $(LOCAL_PATH)/../../hemroid/prebuilt-shared-library.mk
