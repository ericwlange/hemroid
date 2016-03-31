LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE            := libintl
LOCAL_SRC_FILES         := ../../$(TARGET_ARCH_ABI)/lib/libintl.so
LOCAL_SHARED_LIBRARIES  := libiconv
LOCAL_EXPORT_CFLAGS     := -I$(LOCAL_PATH)/../../$(TARGET_ARCH_ABI)/include
LOCAL_EXPORT_LDLIBS     := -L$(LOCAL_PATH)/../../$(TARGET_ARCH_ABI)/lib -lintl
$(LOCAL_MODULE): $(LOCAL_SHARED_LIBRARIES)
	$(shell mkdir -p src/main/java/org/liquidplayer/hemroid)
	$(shell cp -r $(LOCAL_PATH)/../../java/Intl.java src/main/java/org/liquidplayer/hemroid)
$(LOCAL_MODULE)_JavaInterface:
	$(eval EXPORT_JAVA_INTERFACE += new Intl(context);)

include $(PREBUILT_SHARED_LIBRARY)

$(call import-module, iconv)
