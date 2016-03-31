LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE    := libiconv
LOCAL_SRC_FILES := ../../$(TARGET_ARCH_ABI)/lib/libiconv.so
LOCAL_EXPORT_LDLIBS := -L$(LOCAL_PATH)/../../$(TARGET_ARCH_ABI)/lib -liconv
$(LOCAL_MODULE):
	$(shell mkdir -p src/main/java/org/liquidplayer/hemroid)
	$(shell cp -r $(LOCAL_PATH)/../../java/IConv.java src/main/java/org/liquidplayer/hemroid)
$(LOCAL_MODULE)_JavaInterface:
	$(eval EXPORT_JAVA_INTERFACE += new IConv(context);)

include $(PREBUILT_SHARED_LIBRARY)
