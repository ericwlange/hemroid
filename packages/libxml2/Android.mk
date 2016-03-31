LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE        	:= libxml2
LOCAL_SRC_FILES     	:= ../../$(TARGET_ARCH_ABI)/lib/libxml2.so
LOCAL_EXPORT_CFLAGS 	:= -I$(LOCAL_PATH)/../../$(TARGET_ARCH_ABI)/include/libxml2
LOCAL_EXPORT_LDLIBS     := -L$(LOCAL_PATH)/../../$(TARGET_ARCH_ABI)/lib -lxml2
$(LOCAL_MODULE):
	$(shell mkdir -p src/main/java/org/liquidplayer/hemroid)
	$(shell cp -r $(LOCAL_PATH)/../../java/XML2.java src/main/java/org/liquidplayer/hemroid)
$(LOCAL_MODULE)_JavaInterface:
	$(eval EXPORT_JAVA_INTERFACE += new XML2(context);)

include $(PREBUILT_SHARED_LIBRARY)