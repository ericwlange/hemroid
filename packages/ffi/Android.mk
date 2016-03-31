LOCAL_PATH := $(call my-dir)

ifneq (,$(filter 64,$(TARGET_ARCH_ABI)))
	LIB64=lib64
else
	LIB64=lib
endif

include $(CLEAR_VARS)

LOCAL_MODULE		:= libffi
LOCAL_SRC_FILES		:= ../../$(TARGET_ARCH_ABI)/$(LIB64)/libffi.so
LOCAL_EXPORT_CFLAGS := -I$(LOCAL_PATH)/../../$(TARGET_ARCH_ABI)/$(LIB64)/libffi-3.0.13/include
LOCAL_EXPORT_LDLIBS := -L$(LOCAL_PATH)/../../$(TARGET_ARCH_ABI)/$(LIB64) -lffi
$(LOCAL_MODULE):
	$(shell mkdir -p src/main/java/org/liquidplayer/hemroid)
	$(shell cp -r $(LOCAL_PATH)/../../java/FFI.java src/main/java/org/liquidplayer/hemroid)
$(LOCAL_MODULE)_JavaInterface:
	$(eval EXPORT_JAVA_INTERFACE += new FFI(context);)

include $(PREBUILT_SHARED_LIBRARY)
