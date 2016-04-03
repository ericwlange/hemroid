LOCAL_PATH := $(call my-dir)
VAULT_PATH := ../../vault/hemroot/$(TARGET_ARCH_ABI)

# icudata
include $(CLEAR_VARS)

LOCAL_MODULE        	:= icudata
LOCAL_SRC_FILES     	:= $(VAULT_PATH)/lib/libicudata.so
LOCAL_EXPORT_CFLAGS 	:= -I$(LOCAL_PATH)/$(VAULT_PATH)/include
LOCAL_EXPORT_LDLIBS     := -L$(LOCAL_PATH)/$(VAULT_PATH)/lib -l$(LOCAL_MODULE)
$(LOCAL_MODULE):
	$(shell mkdir -p src/main/java/org/liquidplayer/hemroid)
	$(shell cp -r $(LOCAL_PATH)/../icu/java/ICUData.java src/main/java/org/liquidplayer/hemroid)
$(LOCAL_MODULE)_JavaInterface:
	$(eval EXPORT_JAVA_INTERFACE += new ICUData(context);)
$(LOCAL_PATH)/$(LOCAL_SRC_FILES):
	$(LOCAL_PATH)/../../hemroid install --abi=$(TARGET_ARCH_ABI) icu
libraries: $(LOCAL_PATH)/$(LOCAL_SRC_FILES)

include $(LOCAL_PATH)/../hemroid/prebuilt-shared-library.mk

# icustub
include $(CLEAR_VARS)

LOCAL_MODULE        	:= icustub
LOCAL_SRC_FILES     	:= $(VAULT_PATH)/lib/icu/stubdata/libicudata.so
LOCAL_SHARED_LIBRARIES  := icudata
LOCAL_EXPORT_CFLAGS 	:= -I$(LOCAL_PATH)/$(VAULT_PATH)/include
LOCAL_EXPORT_LDLIBS     := -L$(LOCAL_PATH)/$(VAULT_PATH)/lib/icu/stubdata -licudata
$(LOCAL_MODULE)_JavaInterface:
	$(eval EXPORT_JAVA_INTERFACE += new ICUData(context);)
$(LOCAL_PATH)/$(LOCAL_SRC_FILES):
	$(LOCAL_PATH)/../../hemroid install --abi=$(TARGET_ARCH_ABI) icu
libraries: $(LOCAL_PATH)/$(LOCAL_SRC_FILES)

include $(LOCAL_PATH)/../hemroid/prebuilt-shared-library.mk

# icuuc
include $(CLEAR_VARS)

LOCAL_MODULE        	:= icuuc
LOCAL_SRC_FILES     	:= $(VAULT_PATH)/lib/libicuuc.so
LOCAL_SHARED_LIBRARIES  := icudata
LOCAL_EXPORT_CFLAGS 	:= -I$(LOCAL_PATH)/$(VAULT_PATH)/include
LOCAL_EXPORT_LDLIBS     := -L$(LOCAL_PATH)/$(VAULT_PATH)/lib -l$(LOCAL_MODULE)
$(LOCAL_MODULE): $(LOCAL_SHARED_LIBRARIES)
	$(shell mkdir -p src/main/java/org/liquidplayer/hemroid)
	$(shell cp -r $(LOCAL_PATH)/../icu/java/ICUUC.java src/main/java/org/liquidplayer/hemroid)
$(LOCAL_MODULE)_JavaInterface:
	$(eval EXPORT_JAVA_INTERFACE += new ICUUC(context);)
$(LOCAL_PATH)/$(LOCAL_SRC_FILES):
	$(LOCAL_PATH)/../../hemroid install --abi=$(TARGET_ARCH_ABI) icu
libraries: $(LOCAL_PATH)/$(LOCAL_SRC_FILES)

include $(LOCAL_PATH)/../hemroid/prebuilt-shared-library.mk

# icui18n
include $(CLEAR_VARS)

LOCAL_MODULE        	:= icui18n
LOCAL_SRC_FILES     	:= $(VAULT_PATH)/lib/libicui18n.so
LOCAL_SHARED_LIBRARIES  := icudata
LOCAL_EXPORT_CFLAGS 	:= -I$(LOCAL_PATH)/$(VAULT_PATH)/include
LOCAL_EXPORT_LDLIBS     := -L$(LOCAL_PATH)/$(VAULT_PATH)/lib -l$(LOCAL_MODULE)
$(LOCAL_MODULE): $(LOCAL_SHARED_LIBRARIES)
	$(shell mkdir -p src/main/java/org/liquidplayer/hemroid)
	$(shell cp -r $(LOCAL_PATH)/../icu/java/ICUI18n.java src/main/java/org/liquidplayer/hemroid)
$(LOCAL_MODULE)_JavaInterface:
	$(eval EXPORT_JAVA_INTERFACE += new ICUI18n(context);)
$(LOCAL_PATH)/$(LOCAL_SRC_FILES):
	$(LOCAL_PATH)/../../hemroid install --abi=$(TARGET_ARCH_ABI) icu
libraries: $(LOCAL_PATH)/$(LOCAL_SRC_FILES)

include $(LOCAL_PATH)/../hemroid/prebuilt-shared-library.mk