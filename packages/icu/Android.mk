LOCAL_PATH := $(call my-dir)

# icudata
include $(CLEAR_VARS)

LOCAL_MODULE        	:= icudata
LOCAL_SRC_FILES     	:= ../../$(TARGET_ARCH_ABI)/lib/libicudata.so
LOCAL_EXPORT_CFLAGS 	:= -I$(LOCAL_PATH)/../../$(TARGET_ARCH_ABI)/include
LOCAL_EXPORT_LDLIBS     := -L$(LOCAL_PATH)/../../$(TARGET_ARCH_ABI)/lib -l$(LOCAL_MODULE)
$(LOCAL_MODULE):
	$(shell mkdir -p src/main/java/org/liquidplayer/hemroid)
	$(shell cp -r $(LOCAL_PATH)/../../java/ICUData.java src/main/java/org/liquidplayer/hemroid)
$(LOCAL_MODULE)_JavaInterface:
	$(eval EXPORT_JAVA_INTERFACE += new ICUData(context);)

# icustub
include $(CLEAR_VARS)

LOCAL_MODULE        	:= icustub
LOCAL_SRC_FILES     	:= ../../$(TARGET_ARCH_ABI)/lib/icu/stubdata/libicudata.so
LOCAL_SHARED_LIBRARIES  := icudata
LOCAL_EXPORT_CFLAGS 	:= -I$(LOCAL_PATH)/../../$(TARGET_ARCH_ABI)/include
LOCAL_EXPORT_LDLIBS     := -L$(LOCAL_PATH)/../../$(TARGET_ARCH_ABI)/lib/icu/stubdata -licudata
$(LOCAL_MODULE)_JavaInterface:
	$(eval EXPORT_JAVA_INTERFACE += new ICUData(context);)

include $(PREBUILT_SHARED_LIBRARY)

# icuuc
include $(CLEAR_VARS)

LOCAL_MODULE        	:= icuuc
LOCAL_SRC_FILES     	:= ../../$(TARGET_ARCH_ABI)/lib/libicuuc.so
LOCAL_SHARED_LIBRARIES  := icudata
LOCAL_EXPORT_CFLAGS 	:= -I$(LOCAL_PATH)/../../$(TARGET_ARCH_ABI)/include
LOCAL_EXPORT_LDLIBS     := -L$(LOCAL_PATH)/../../$(TARGET_ARCH_ABI)/lib -l$(LOCAL_MODULE)
$(LOCAL_MODULE): $(LOCAL_SHARED_LIBRARIES)
	$(shell mkdir -p src/main/java/org/liquidplayer/hemroid)
	$(shell cp -r $(LOCAL_PATH)/../../java/ICUUC.java src/main/java/org/liquidplayer/hemroid)
$(LOCAL_MODULE)_JavaInterface:
	$(eval EXPORT_JAVA_INTERFACE += new ICUUC(context);)

include $(PREBUILT_SHARED_LIBRARY)

# icui18n
include $(CLEAR_VARS)

LOCAL_MODULE        	:= icui18n
LOCAL_SRC_FILES     	:= ../../$(TARGET_ARCH_ABI)/lib/libicui18n.so
LOCAL_SHARED_LIBRARIES  := icudata
LOCAL_EXPORT_CFLAGS 	:= -I$(LOCAL_PATH)/../../$(TARGET_ARCH_ABI)/include
LOCAL_EXPORT_LDLIBS     := -L$(LOCAL_PATH)/../../$(TARGET_ARCH_ABI)/lib -l$(LOCAL_MODULE)
$(LOCAL_MODULE): $(LOCAL_SHARED_LIBRARIES)
	$(shell mkdir -p src/main/java/org/liquidplayer/hemroid)
	$(shell cp -r $(LOCAL_PATH)/../../java/ICUI18n.java src/main/java/org/liquidplayer/hemroid)
$(LOCAL_MODULE)_JavaInterface:
	$(eval EXPORT_JAVA_INTERFACE += new ICUI18n(context);)

include $(PREBUILT_SHARED_LIBRARY)
