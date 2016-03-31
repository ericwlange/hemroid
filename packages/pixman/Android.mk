LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE        := pixman
LOCAL_SRC_FILES     := ../../$(TARGET_ARCH_ABI)/lib/libpixman-1.so
LOCAL_EXPORT_CFLAGS := -I$(LOCAL_PATH)/../../$(TARGET_ARCH_ABI)/include/pixman-1
LOCAL_EXPORT_LDLIBS := -L$(LOCAL_PATH)/../../$(TARGET_ARCH_ABI)/lib -lpixman-1
$(LOCAL_MODULE):
	$(shell mkdir -p src/main/java/org/liquidplayer/hemroid)
	$(shell cp -r $(LOCAL_PATH)/../../java/Pixman.java src/main/java/org/liquidplayer/hemroid)
$(LOCAL_MODULE)_JavaInterface:
	$(eval EXPORT_JAVA_INTERFACE += new Pixman(context);)

include $(PREBUILT_SHARED_LIBRARY)
