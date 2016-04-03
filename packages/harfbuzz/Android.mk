LOCAL_PATH := $(call my-dir)
VAULT_PATH := ../../vault/hemroot/$(TARGET_ARCH_ABI)

include $(CLEAR_VARS)

LOCAL_MODULE        	:= harfbuzz
LOCAL_SRC_FILES     	:= $(VAULT_PATH)/lib/libharfbuzz.so
LOCAL_SHARED_LIBRARIES 	:= freetype
LOCAL_EXPORT_CFLAGS 	:= -I$(LOCAL_PATH)/$(VAULT_PATH)/include/harfbuzz
LOCAL_EXPORT_LDLIBS     := -L$(LOCAL_PATH)/$(VAULT_PATH)/lib -l$(LOCAL_MODULE)
$(LOCAL_MODULE): $(LOCAL_SHARED_LIBRARIES)
	$(shell mkdir -p src/main/java/org/liquidplayer/hemroid)
	$(shell cp -r $(LOCAL_PATH)/../harfbuzz/java/Harfbuzz.java src/main/java/org/liquidplayer/hemroid)
$(LOCAL_MODULE)_JavaInterface:
	$(eval EXPORT_JAVA_INTERFACE += new Harfbuzz(context);)
$(LOCAL_PATH)/$(LOCAL_SRC_FILES):
	$(LOCAL_PATH)/../../hemroid install --abi=$(TARGET_ARCH_ABI) harfbuzz
libraries: $(LOCAL_PATH)/$(LOCAL_SRC_FILES)

include $(LOCAL_PATH)/../hemroid/prebuilt-shared-library.mk

include $(CLEAR_VARS)

LOCAL_MODULE        	:= harfbuzz-icu
LOCAL_SRC_FILES     	:= $(VAULT_PATH)/lib/libharfbuzz-icu.so
LOCAL_SHARED_LIBRARIES 	:= freetype icudata icuuc
LOCAL_EXPORT_CFLAGS 	:= -I$(LOCAL_PATH)/$(VAULT_PATH)/include/harfbuzz
LOCAL_EXPORT_LDLIBS     := -L$(LOCAL_PATH)/$(VAULT_PATH)/lib -l$(LOCAL_MODULE)
$(LOCAL_MODULE): $(LOCAL_SHARED_LIBRARIES)
	$(shell mkdir -p src/main/java/org/liquidplayer/hemroid)
	$(shell cp -r $(LOCAL_PATH)/../harfbuzz/java/HarfbuzzICU.java src/main/java/org/liquidplayer/hemroid)
$(LOCAL_MODULE)_JavaInterface:
	$(eval EXPORT_JAVA_INTERFACE += new HarfbuzzICU(context);)
$(LOCAL_PATH)/$(LOCAL_SRC_FILES):
	$(LOCAL_PATH)/../../hemroid install --abi=$(TARGET_ARCH_ABI) harfbuzz
libraries: $(LOCAL_PATH)/$(LOCAL_SRC_FILES)

include $(LOCAL_PATH)/../hemroid/prebuilt-shared-library.mk

$(call import-module, icu)
$(call import-module, freetype2)