LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE        	:= libwebp
LOCAL_SRC_FILES     	:= ../../$(TARGET_ARCH_ABI)/lib/libwebp.so
LOCAL_SHARED_LIBRARIES 	:= libpng libjpeg
LOCAL_EXPORT_CFLAGS 	:= -I$(LOCAL_PATH)/../../$(TARGET_ARCH_ABI)/include
LOCAL_LDLIBS 			:= -lm
LOCAL_EXPORT_LDLIBS     := -L$(LOCAL_PATH)/../../$(TARGET_ARCH_ABI)/lib -lwebp
$(LOCAL_MODULE): $(LOCAL_SHARED_LIBRARIES)
	$(shell mkdir -p src/main/java/org/liquidplayer/hemroid)
	$(shell cp -r $(LOCAL_PATH)/../../java/Webp.java src/main/java/org/liquidplayer/hemroid)
$(LOCAL_MODULE)_JavaInterface:
	$(eval EXPORT_JAVA_INTERFACE += new Webp(context);)

include $(PREBUILT_SHARED_LIBRARY)

$(call import-module, libpng)
$(call import-module, libjpeg-turbo)
