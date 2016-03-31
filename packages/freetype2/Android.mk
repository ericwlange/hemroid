LOCAL_PATH := $(call my-dir)

# freetype
include $(CLEAR_VARS)

LOCAL_MODULE        	:= freetype
LOCAL_SRC_FILES     	:= ../../$(TARGET_ARCH_ABI)/lib/libfreetype.so
LOCAL_SHARED_LIBRARIES 	:= libpng
LOCAL_EXPORT_CFLAGS 	:= -I$(LOCAL_PATH)/../../$(TARGET_ARCH_ABI)/include/freetype2
LOCAL_EXPORT_LDLIBS     := -L$(LOCAL_PATH)/../../$(TARGET_ARCH_ABI)/lib -l$(LOCAL_MODULE)
$(LOCAL_MODULE): $(LOCAL_SHARED_LIBRARIES)
	$(shell mkdir -p src/main/java/org/liquidplayer/hemroid)
	$(shell cp -r $(LOCAL_PATH)/../../java/Freetype.java src/main/java/org/liquidplayer/hemroid)
$(LOCAL_MODULE)_JavaInterface:
	$(eval EXPORT_JAVA_INTERFACE += new Freetype(context);)

include $(PREBUILT_SHARED_LIBRARY)

$(call import-module, libpng)