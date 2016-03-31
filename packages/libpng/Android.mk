LOCAL_PATH := $(call my-dir)

# libpng
include $(CLEAR_VARS)

LOCAL_MODULE        := libpng
LOCAL_SRC_FILES     := ../../$(TARGET_ARCH_ABI)/lib/libpng16.so
LOCAL_EXPORT_CFLAGS := -I$(LOCAL_PATH)/../../$(TARGET_ARCH_ABI)/include/libpng16
LOCAL_EXPORT_LDLIBS     := -L$(LOCAL_PATH)/../../$(TARGET_ARCH_ABI)/lib -lpng16
$(LOCAL_MODULE):
	$(shell mkdir -p src/main/java/org/liquidplayer/hemroid)
	$(shell cp -r $(LOCAL_PATH)/../../java/PNG.java src/main/java/org/liquidplayer/hemroid)
$(LOCAL_MODULE)_JavaInterface:
	$(eval EXPORT_JAVA_INTERFACE += new PNG(context);)

include $(PREBUILT_SHARED_LIBRARY)