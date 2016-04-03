LOCAL_PATH := $(call my-dir)
VAULT_PATH := ../../vault/hemroot/$(TARGET_ARCH_ABI)

# gstbase
include $(CLEAR_VARS)

LOCAL_MODULE			:= gstbase
LOCAL_SRC_FILES			:= $(VAULT_PATH)/lib/libgstbase-1.0.so
LOCAL_SHARED_LIBRARIES	:= glib ffi
LOCAL_EXPORT_CFLAGS		:= -I$(LOCAL_PATH)/$(VAULT_PATH)/include/gstreamer-1.0
LOCAL_LDLIBS			:= -lz -lm
$(LOCAL_MODULE): $(LOCAL_SHARED_LIBRARIES)
	$(shell mkdir -p src/main/java/org/liquidplayer/hemroid)
	$(shell cp -r $(LOCAL_PATH)/../gstreamer/java/GstBase.java src/main/java/org/liquidplayer/hemroid)
$(LOCAL_MODULE)_JavaInterface:
	$(eval EXPORT_JAVA_INTERFACE += new GstBase(context);)
$(LOCAL_PATH)/$(LOCAL_SRC_FILES):
	$(LOCAL_PATH)/../../hemroid install --abi=$(TARGET_ARCH_ABI) gstreamer
libraries: $(LOCAL_PATH)/$(LOCAL_SRC_FILES)

include $(LOCAL_PATH)/../hemroid/prebuilt-shared-library.mk

# gstreamer
include $(CLEAR_VARS)

LOCAL_MODULE			:= gstreamer
LOCAL_SRC_FILES			:= $(VAULT_PATH)/lib/libgstreamer-1.0.so
LOCAL_SHARED_LIBRARIES	:= gstbase
LOCAL_EXPORT_CFLAGS		:= -I$(LOCAL_PATH)/$(VAULT_PATH)/include/gstreamer-1.0
LOCAL_EXPORT_LDLIBS		:= -L$(LOCAL_PATH)/$(VAULT_PATH)/lib -l$(LOCAL_MODULE)-1.0
$(LOCAL_MODULE): $(LOCAL_SHARED_LIBRARIES)
	$(shell mkdir -p src/main/java/org/liquidplayer/hemroid)
	$(shell cp -r $(LOCAL_PATH)/../gstreamer/java/GStreamer.java src/main/java/org/liquidplayer/hemroid)
$(LOCAL_MODULE)_JavaInterface:
	$(eval EXPORT_JAVA_INTERFACE += new GStreamer(context);)
$(LOCAL_PATH)/$(LOCAL_SRC_FILES):
	$(LOCAL_PATH)/../../hemroid install --abi=$(TARGET_ARCH_ABI) gstreamer
libraries: $(LOCAL_PATH)/$(LOCAL_SRC_FILES)

include $(LOCAL_PATH)/../hemroid/prebuilt-shared-library.mk

# gstcheck
include $(CLEAR_VARS)

LOCAL_MODULE			:= gstcheck
LOCAL_SRC_FILES			:= $(VAULT_PATH)/lib/libgstcheck-1.0.so
LOCAL_SHARED_LIBRARIES	:= gstreamer
LOCAL_EXPORT_CFLAGS		:= -I$(LOCAL_PATH)/$(VAULT_PATH)/include/gstreamer-1.0
LOCAL_EXPORT_LDLIBS		:= -L$(LOCAL_PATH)/$(VAULT_PATH)/lib -l$(LOCAL_MODULE)-1.0
$(LOCAL_MODULE): $(LOCAL_SHARED_LIBRARIES)
	$(shell mkdir -p src/main/java/org/liquidplayer/hemroid)
	$(shell cp -r $(LOCAL_PATH)/../gstreamer/java/GstCheck.java src/main/java/org/liquidplayer/hemroid)
$(LOCAL_MODULE)_JavaInterface:
	$(eval EXPORT_JAVA_INTERFACE += new GstCheck(context);)
$(LOCAL_PATH)/$(LOCAL_SRC_FILES):
	$(LOCAL_PATH)/../../hemroid install --abi=$(TARGET_ARCH_ABI) gstreamer
libraries: $(LOCAL_PATH)/$(LOCAL_SRC_FILES)

include $(LOCAL_PATH)/../hemroid/prebuilt-shared-library.mk

# gstcontroller
include $(CLEAR_VARS)

LOCAL_MODULE			:= gstcontroller
LOCAL_SRC_FILES			:= $(VAULT_PATH)/lib/libgstcontroller-1.0.so
LOCAL_SHARED_LIBRARIES	:= gstreamer
LOCAL_EXPORT_CFLAGS		:= -I$(LOCAL_PATH)/$(VAULT_PATH)/include/gstreamer-1.0
LOCAL_EXPORT_LDLIBS		:= -L$(LOCAL_PATH)/$(VAULT_PATH)/lib -l$(LOCAL_MODULE)-1.0
$(LOCAL_MODULE): $(LOCAL_SHARED_LIBRARIES)
	$(shell mkdir -p src/main/java/org/liquidplayer/hemroid)
	$(shell cp -r $(LOCAL_PATH)/../gstreamer/java/GstController.java src/main/java/org/liquidplayer/hemroid)
$(LOCAL_MODULE)_JavaInterface:
	$(eval EXPORT_JAVA_INTERFACE += new GstController(context);)
$(LOCAL_PATH)/$(LOCAL_SRC_FILES):
	$(LOCAL_PATH)/../../hemroid install --abi=$(TARGET_ARCH_ABI) gstreamer
libraries: $(LOCAL_PATH)/$(LOCAL_SRC_FILES)

include $(LOCAL_PATH)/../hemroid/prebuilt-shared-library.mk

# gstnet
include $(CLEAR_VARS)

LOCAL_MODULE			:= gstnet
LOCAL_SRC_FILES			:= $(VAULT_PATH)/lib/libgstnet-1.0.so
LOCAL_SHARED_LIBRARIES	:= gstreamer
LOCAL_EXPORT_CFLAGS		:= -I$(LOCAL_PATH)/$(VAULT_PATH)/include/gstreamer-1.0
LOCAL_EXPORT_LDLIBS		:= -L$(LOCAL_PATH)/$(VAULT_PATH)/lib -l$(LOCAL_MODULE)-1.0
$(LOCAL_MODULE): $(LOCAL_SHARED_LIBRARIES)
	$(shell mkdir -p src/main/java/org/liquidplayer/hemroid)
	$(shell cp -r $(LOCAL_PATH)/../gstreamer/java/GstNet.java src/main/java/org/liquidplayer/hemroid)
$(LOCAL_MODULE)_JavaInterface:
	$(eval EXPORT_JAVA_INTERFACE += new GstNet(context);)
$(LOCAL_PATH)/$(LOCAL_SRC_FILES):
	$(LOCAL_PATH)/../../hemroid install --abi=$(TARGET_ARCH_ABI) gstreamer
libraries: $(LOCAL_PATH)/$(LOCAL_SRC_FILES)

include $(LOCAL_PATH)/../hemroid/prebuilt-shared-library.mk

$(call import-module, glib-2)
