LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE        	:= libsoup
LOCAL_SRC_FILES     	:= ../../$(TARGET_ARCH_ABI)/lib/libsoup-2.4.so
LOCAL_SHARED_LIBRARIES 	:= libxml2 sqlite3
LOCAL_EXPORT_CFLAGS 	:= -I$(LOCAL_PATH)/../../$(TARGET_ARCH_ABI)/include/libsoup-2.4
LOCAL_EXPORT_LDLIBS     := -L$(LOCAL_PATH)/../../$(TARGET_ARCH_ABI)/lib -lsoup-2.4
$(LOCAL_MODULE): $(LOCAL_SHARED_LIBRARIES)
	$(shell mkdir -p src/main/java/org/liquidplayer/hemroid)
	$(shell cp -r $(LOCAL_PATH)/../../java/Soup.java src/main/java/org/liquidplayer/hemroid)
$(LOCAL_MODULE)_JavaInterface:
	$(eval EXPORT_JAVA_INTERFACE += new Soup(context);)

include $(PREBUILT_SHARED_LIBRARY)

$(call import-module, libxml2)
$(call import-module, sqlite3)
