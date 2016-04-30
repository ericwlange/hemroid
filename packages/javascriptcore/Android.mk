LOCAL_PATH := $(call my-dir)
VAULT_PATH := ../../vault/hemroot/$(TARGET_ARCH_ABI)

# javascriptcore
include $(CLEAR_VARS)

LOCAL_MODULE        	:= javascriptcore_$(TARGET_ARCH_ABI)
LOCAL_SRC_FILES     	:= $(VAULT_PATH)/lib/libjavascriptcoregtk-4.0.so
LOCAL_SHARED_LIBRARIES 	:= icui18n_$(TARGET_ARCH_ABI) \
                           glib_$(TARGET_ARCH_ABI) \
                           icuuc_$(TARGET_ARCH_ABI) \
                           gnustl_shared \
                           gio_$(TARGET_ARCH_ABI) \
                           gobject_$(TARGET_ARCH_ABI)
LOCAL_LDLIBS 			:= -llog -lz -lm -lstdc++
LOCAL_EXPORT_CFLAGS 	:= -I$(LOCAL_PATH)/$(VAULT_PATH)/include/webkitgtk-4.0
LOCAL_EXPORT_LDLIBS     := -L$(LOCAL_PATH)/$(VAULT_PATH)/lib -ljavascriptcoregtk-4.0

$(LOCAL_MODULE): $(LOCAL_SHARED_LIBRARIES)
	$(shell mkdir -p src/main/java/org/liquidplayer/hemroid)
	$(shell cp -r $(LOCAL_PATH)/../webkitgtk+/java/JavaScriptCoreGTK.java src/main/java/org/liquidplayer/hemroid)
$(LOCAL_MODULE)_JavaInterface:
	$(if $(findstring JavaScriptCoreGTK,$(EXPORT_JAVA_INTERFACE)),,$(eval EXPORT_JAVA_INTERFACE += new JavaScriptCoreGTK(context);))
$(LOCAL_PATH)/$(LOCAL_SRC_FILES):
	$(LOCAL_PATH)/../../hemroid install --abi=$(TARGET_ARCH_ABI) javascriptcore
libraries: $(LOCAL_PATH)/$(LOCAL_SRC_FILES)

include $(LOCAL_PATH)/../hemroid/prebuilt-shared-library.mk

$(call import-module, icu)
$(call import-module, glib-2)
