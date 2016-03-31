LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE        	:= gnutls
LOCAL_SRC_FILES     	:= ../../$(TARGET_ARCH_ABI)/lib/libgnutls.so
LOCAL_SHARED_LIBRARIES 	:= gnustl_shared libtasn1 nettle hogweed gmp
LOCAL_LDLIBS 			:= -lz -lm -lstdc++
LOCAL_EXPORT_CFLAGS 	:= -I$(LOCAL_PATH)/../../$(TARGET_ARCH_ABI)/include
LOCAL_EXPORT_LDLIBS     := -L$(LOCAL_PATH)/../../$(TARGET_ARCH_ABI)/lib -l$(LOCAL_MODULE)
$(LOCAL_MODULE): $(LOCAL_SHARED_LIBRARIES)
	$(shell mkdir -p src/main/java/org/liquidplayer/hemroid)
	$(shell cp -r $(LOCAL_PATH)/../../java/GnuTLS.java src/main/java/org/liquidplayer/hemroid)
$(LOCAL_MODULE)_JavaInterface:
	$(eval EXPORT_JAVA_INTERFACE += new GnuTLS(context);)

include $(PREBUILT_SHARED_LIBRARY)

$(call import-module, libtasn1)
$(call import-module, nettle)
$(call import-module, gmp)
