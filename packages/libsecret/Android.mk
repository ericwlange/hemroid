LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE        	:= libsecret
LOCAL_SRC_FILES     	:= ../../$(TARGET_ARCH_ABI)/lib/libsecret-1.so
LOCAL_SHARED_LIBRARIES 	:= glib
LOCAL_EXPORT_CFLAGS 	:= -I$(LOCAL_PATH)/../../$(TARGET_ARCH_ABI)/include
LOCAL_EXPORT_LDLIBS     := -L$(LOCAL_PATH)/../../$(TARGET_ARCH_ABI)/lib -lsecret-1
$(LOCAL_MODULE): $(LOCAL_SHARED_LIBRARIES)
	$(shell mkdir -p src/main/java/org/liquidplayer/hemroid)
	$(shell cp -r $(LOCAL_PATH)/../../java/Secret.java src/main/java/org/liquidplayer/hemroid)
$(LOCAL_MODULE)_JavaInterface:
	$(eval EXPORT_JAVA_INTERFACE += new Secret(context);)

include $(PREBUILT_SHARED_LIBRARY)

$(call import-module, glib-2)
