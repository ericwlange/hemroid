# icustub
LOCAL_PATH := $(call my-dir)
VAULT_PATH := ../../../vault/hemroot/$(TARGET_ARCH_ABI)

include $(CLEAR_VARS)

LOCAL_MODULE        	:= icustub_$(TARGET_ARCH_ABI)
LOCAL_SRC_FILES     	:= $(VAULT_PATH)/lib/icu/stubdata/libicuhemdata.so
LOCAL_EXPORT_CFLAGS 	:= -I$(LOCAL_PATH)/$(VAULT_PATH)/include
LOCAL_EXPORT_LDLIBS     := -L$(LOCAL_PATH)/$(VAULT_PATH)/lib/icu/stubdata -licuhemdata
$(LOCAL_MODULE):
	$(shell mkdir -p src/main/java/org/liquidplayer/hemroid)
	$(shell cp -r $(LOCAL_PATH)/../icu/java/ICUData.java src/main/java/org/liquidplayer/hemroid)
$(LOCAL_MODULE)_JavaInterface:
	$(if $(findstring ICUData,$(EXPORT_JAVA_INTERFACE)),,$(eval EXPORT_JAVA_INTERFACE += new ICUData(context);))
$(LOCAL_PATH)/$(LOCAL_SRC_FILES):
	hemroid install --abi=$(TARGET_ARCH_ABI) icu
libraries: $(LOCAL_PATH)/$(LOCAL_SRC_FILES)

include $(LOCAL_PATH)/../../hemroid/prebuilt-shared-library.mk

