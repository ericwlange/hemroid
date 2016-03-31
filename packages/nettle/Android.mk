LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE			:= nettle
LOCAL_SRC_FILES			:= ../../$(TARGET_ARCH_ABI)/lib/libnettle.so
LOCAL_EXPORT_CFLAGS		:= -I$(LOCAL_PATH)/../../$(TARGET_ARCH_ABI)/include
LOCAL_EXPORT_LDLIBS		:= -L$(LOCAL_PATH)/../../$(TARGET_ARCH_ABI)/lib -l$(LOCAL_MODULE)
$(LOCAL_MODULE):
	$(shell mkdir -p src/main/java/org/liquidplayer/hemroid)
	$(shell cp -r $(LOCAL_PATH)/../../java/Nettle.java src/main/java/org/liquidplayer/hemroid)
$(LOCAL_MODULE)_JavaInterface:
	$(eval EXPORT_JAVA_INTERFACE += new Nettle(context);)

include $(PREBUILT_SHARED_LIBRARY)

include $(CLEAR_VARS)

LOCAL_MODULE			:= hogweed
LOCAL_SRC_FILES			:= ../../$(TARGET_ARCH_ABI)/lib/libhogweed.so
LOCAL_EXPORT_CFLAGS		:= -I$(LOCAL_PATH)/../../$(TARGET_ARCH_ABI)/include
LOCAL_EXPORT_LDLIBS		:= -L$(LOCAL_PATH)/../../$(TARGET_ARCH_ABI)/lib -l$(LOCAL_MODULE)
$(LOCAL_MODULE):
	$(shell mkdir -p src/main/java/org/liquidplayer/hemroid)
	$(shell cp -r $(LOCAL_PATH)/../../java/Hogweed.java src/main/java/org/liquidplayer/hemroid)
$(LOCAL_MODULE)_JavaInterface:
	$(eval EXPORT_JAVA_INTERFACE += new Hogweed(context);)

include $(PREBUILT_SHARED_LIBRARY)