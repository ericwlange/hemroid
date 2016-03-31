LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE        	:= fontconfig
LOCAL_SRC_FILES     	:= ../../$(TARGET_ARCH_ABI)/lib/libfontconfig.so
LOCAL_SHARED_LIBRARIES 	:= libxml2 harfbuzz
LOCAL_EXPORT_CFLAGS 	:= -I$(LOCAL_PATH)/../../$(TARGET_ARCH_ABI)/include
LOCAL_EXPORT_LDLIBS     := -L$(LOCAL_PATH)/../../$(TARGET_ARCH_ABI)/lib -l$(LOCAL_MODULE)
$(LOCAL_MODULE): $(LOCAL_SHARED_LIBRARIES)
	$(shell mkdir -p src/main/java/org/liquidplayer/hemroid)
	$(shell cp -r $(LOCAL_PATH)/../../java/FontConfig.java src/main/java/org/liquidplayer/hemroid)
$(LOCAL_MODULE)_JavaInterface:
	$(eval EXPORT_JAVA_INTERFACE += new FontConfig(context);)

include $(PREBUILT_SHARED_LIBRARY)

$(call import-module, libxml2)
$(call import-module, harfbuzz)