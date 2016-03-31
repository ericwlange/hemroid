LOCAL_PATH := $(call my-dir)

# gstbase
include $(CLEAR_VARS)

LOCAL_MODULE			:= gstbase
LOCAL_SRC_FILES			:= ../../$(TARGET_ARCH_ABI)/lib/libgstbase-1.0.so
LOCAL_SHARED_LIBRARIES	:= glib ffi
LOCAL_EXPORT_CFLAGS		:= -I$(LOCAL_PATH)/../../$(TARGET_ARCH_ABI)/include/gstreamer-1.0
LOCAL_LDLIBS			:= -lz -lm
$(LOCAL_MODULE): $(LOCAL_SHARED_LIBRARIES)
	$(shell mkdir -p src/main/java/org/liquidplayer/hemroid)
	$(shell cp -r $(LOCAL_PATH)/../../java/GstBase.java src/main/java/org/liquidplayer/hemroid)
$(LOCAL_MODULE)_JavaInterface:
	$(eval EXPORT_JAVA_INTERFACE += new GstBase(context);)

include $(PREBUILT_SHARED_LIBRARY)

# gstreamer
include $(CLEAR_VARS)

LOCAL_MODULE			:= gstreamer
LOCAL_SRC_FILES			:= ../../$(TARGET_ARCH_ABI)/lib/libgstreamer-1.0.so
LOCAL_SHARED_LIBRARIES	:= gstbase
LOCAL_EXPORT_CFLAGS		:= -I$(LOCAL_PATH)/../../$(TARGET_ARCH_ABI)/include/gstreamer-1.0
LOCAL_EXPORT_LDLIBS		:= -L$(LOCAL_PATH)/../../$(TARGET_ARCH_ABI)/lib -l$(LOCAL_MODULE)-1.0
$(LOCAL_MODULE): $(LOCAL_SHARED_LIBRARIES)
	$(shell mkdir -p src/main/java/org/liquidplayer/hemroid)
	$(shell cp -r $(LOCAL_PATH)/../../java/GStreamer.java src/main/java/org/liquidplayer/hemroid)
$(LOCAL_MODULE)_JavaInterface:
	$(eval EXPORT_JAVA_INTERFACE += new GStreamer(context);)

include $(PREBUILT_SHARED_LIBRARY)

# gstcheck
include $(CLEAR_VARS)

LOCAL_MODULE			:= gstcheck
LOCAL_SRC_FILES			:= ../../$(TARGET_ARCH_ABI)/lib/libgstcheck-1.0.so
LOCAL_SHARED_LIBRARIES	:= gstreamer
LOCAL_EXPORT_CFLAGS		:= -I$(LOCAL_PATH)/../../$(TARGET_ARCH_ABI)/include/gstreamer-1.0
LOCAL_EXPORT_LDLIBS		:= -L$(LOCAL_PATH)/../../$(TARGET_ARCH_ABI)/lib -l$(LOCAL_MODULE)-1.0
$(LOCAL_MODULE): $(LOCAL_SHARED_LIBRARIES)
	$(shell mkdir -p src/main/java/org/liquidplayer/hemroid)
	$(shell cp -r $(LOCAL_PATH)/../../java/GstCheck.java src/main/java/org/liquidplayer/hemroid)
$(LOCAL_MODULE)_JavaInterface:
	$(eval EXPORT_JAVA_INTERFACE += new GstCheck(context);)

include $(PREBUILT_SHARED_LIBRARY)

# gstcontroller
include $(CLEAR_VARS)

LOCAL_MODULE			:= gstcontroller
LOCAL_SRC_FILES			:= ../../$(TARGET_ARCH_ABI)/lib/libgstcontroller-1.0.so
LOCAL_SHARED_LIBRARIES	:= gstreamer
LOCAL_EXPORT_CFLAGS		:= -I$(LOCAL_PATH)/../../$(TARGET_ARCH_ABI)/include/gstreamer-1.0
LOCAL_EXPORT_LDLIBS		:= -L$(LOCAL_PATH)/../../$(TARGET_ARCH_ABI)/lib -l$(LOCAL_MODULE)-1.0
$(LOCAL_MODULE): $(LOCAL_SHARED_LIBRARIES)
	$(shell mkdir -p src/main/java/org/liquidplayer/hemroid)
	$(shell cp -r $(LOCAL_PATH)/../../java/GstController.java src/main/java/org/liquidplayer/hemroid)
$(LOCAL_MODULE)_JavaInterface:
	$(eval EXPORT_JAVA_INTERFACE += new GstController(context);)

include $(PREBUILT_SHARED_LIBRARY)

# gstnet
include $(CLEAR_VARS)

LOCAL_MODULE			:= gstnet
LOCAL_SRC_FILES			:= ../../$(TARGET_ARCH_ABI)/lib/libgstnet-1.0.so
LOCAL_SHARED_LIBRARIES	:= gstreamer
LOCAL_EXPORT_CFLAGS		:= -I$(LOCAL_PATH)/../../$(TARGET_ARCH_ABI)/include/gstreamer-1.0
LOCAL_EXPORT_LDLIBS		:= -L$(LOCAL_PATH)/../../$(TARGET_ARCH_ABI)/lib -l$(LOCAL_MODULE)-1.0
$(LOCAL_MODULE): $(LOCAL_SHARED_LIBRARIES)
	$(shell mkdir -p src/main/java/org/liquidplayer/hemroid)
	$(shell cp -r $(LOCAL_PATH)/../../java/GstNet.java src/main/java/org/liquidplayer/hemroid)
$(LOCAL_MODULE)_JavaInterface:
	$(eval EXPORT_JAVA_INTERFACE += new GstNet(context);)

include $(PREBUILT_SHARED_LIBRARY)

$(call import-module, glib-2)
