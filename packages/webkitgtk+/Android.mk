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
                           _$(TARGET_ARCH_ABI) \
                           gio_$(TARGET_ARCH_ABI) \
                           gobject_$(TARGET_ARCH_ABI)
LOCAL_LDLIBS 			:= -llog -lz -lm -lstdc++
LOCAL_EXPORT_CFLAGS 	:= -I$(LOCAL_PATH)/$(VAULT_PATH)/include/webkitgtk-4.0
LOCAL_EXPORT_LDLIBS     := -L$(LOCAL_PATH)/$(VAULT_PATH)/lib -ljavascriptcoregtk-4.0

$(LOCAL_MODULE): $(LOCAL_SHARED_LIBRARIES)
	$(shell mkdir -p src/main/java/org/liquidplayer/hemroid)
	$(shell cp -r $(LOCAL_PATH)/../webkitgtk+/java/JavaScriptCoreGTK.java src/main/java/org/liquidplayer/hemroid)
$(LOCAL_MODULE)_JavaInterface:
	$(eval EXPORT_JAVA_INTERFACE += new JavaScriptCoreGTK(context);)
$(LOCAL_PATH)/$(LOCAL_SRC_FILES):
	$(LOCAL_PATH)/../../hemroid install --abi=$(TARGET_ARCH_ABI) webkitgtk+
libraries: $(LOCAL_PATH)/$(LOCAL_SRC_FILES)

include $(LOCAL_PATH)/../hemroid/prebuilt-shared-library.mk

# webcore
include $(CLEAR_VARS)

LOCAL_MODULE        	:= webcore_$(TARGET_ARCH_ABI)
LOCAL_SRC_FILES     	:= $(VAULT_PATH)/lib/libWebCoreGTK.so
LOCAL_SHARED_LIBRARIES  := gtk_$(TARGET_ARCH_ABI) \
                           gdk_$(TARGET_ARCH_ABI) \
                           pangocairo_$(TARGET_ARCH_ABI) \
                           pango_$(TARGET_ARCH_ABI) \
                           atk_$(TARGET_ARCH_ABI) \
                           cairo-gobject_$(TARGET_ARCH_ABI) \
                           cairo_$(TARGET_ARCH_ABI) \
                           gdk-pixbuf_$(TARGET_ARCH_ABI) \
                           glib_$(TARGET_ARCH_ABI) \
                           gio_$(TARGET_ARCH_ABI) \
                           gobject_$(TARGET_ARCH_ABI) \
                           libnotify_$(TARGET_ARCH_ABI) \
                           gthread_$(TARGET_ARCH_ABI) \
                           pangoft2_$(TARGET_ARCH_ABI) \
                           libepoxy_$(TARGET_ARCH_ABI) \
                           icudata_$(TARGET_ARCH_ABI) \
                           icui18n_$(TARGET_ARCH_ABI) \
                           icuuc_$(TARGET_ARCH_ABI) \
                           enchant_$(TARGET_ARCH_ABI) \
                           fontconfig_$(TARGET_ARCH_ABI) \
                           freetype_$(TARGET_ARCH_ABI) \
                           gmodule_$(TARGET_ARCH_ABI) \
                           harfbuzz_$(TARGET_ARCH_ABI) \
                           harfbuzz-icu_$(TARGET_ARCH_ABI) \
                           libjpeg_$(TARGET_ARCH_ABI) \
                           libsecret_$(TARGET_ARCH_ABI) \
                           libsoup_$(TARGET_ARCH_ABI) \
                           libxml2_$(TARGET_ARCH_ABI) \
                           hyphen_$(TARGET_ARCH_ABI) \
                           libpng_$(TARGET_ARCH_ABI) \
                           sqlite3_$(TARGET_ARCH_ABI) \
                           libwebp_$(TARGET_ARCH_ABI) \
                           gstapp_$(TARGET_ARCH_ABI) \
                           gstbase_$(TARGET_ARCH_ABI) \
                           gstreamer_$(TARGET_ARCH_ABI) \
                           gstpbutils_$(TARGET_ARCH_ABI) \
                           gstaudio_$(TARGET_ARCH_ABI) \
                           gsttag_$(TARGET_ARCH_ABI) \
                           gstvideo_$(TARGET_ARCH_ABI) \
                           gstfft_$(TARGET_ARCH_ABI)
LOCAL_LDLIBS 			:= -llog -lz -lm -lstdc++
LOCAL_EXPORT_CFLAGS 	:= -I$(LOCAL_PATH)/$(VAULT_PATH)/include/webkitgtk-4.0
LOCAL_EXPORT_LDLIBS     := -L$(LOCAL_PATH)/$(VAULT_PATH)/lib -lWebCoreGTK

$(LOCAL_MODULE): $(LOCAL_SHARED_LIBRARIES)
	$(shell mkdir -p src/main/java/org/liquidplayer/hemroid)
	$(shell cp -r $(LOCAL_PATH)/../webkitgtk+/java/WebCoreGTK.java src/main/java/org/liquidplayer/hemroid)
$(LOCAL_MODULE)_JavaInterface:
	$(eval EXPORT_JAVA_INTERFACE += new WebCoreGTK(context);)
$(LOCAL_PATH)/$(LOCAL_SRC_FILES):
	$(LOCAL_PATH)/../../hemroid install --abi=$(TARGET_ARCH_ABI) webkitgtk+
libraries: $(LOCAL_PATH)/$(LOCAL_SRC_FILES)

include $(LOCAL_PATH)/../hemroid/prebuilt-shared-library.mk

# webkit2
include $(CLEAR_VARS)

LOCAL_MODULE        	:= webkit2_$(TARGET_ARCH_ABI)
LOCAL_SRC_FILES     	:= $(VAULT_PATH)/lib/libwebkit2gtk-4.0.so
LOCAL_SHARED_LIBRARIES 	:= javascriptcore_$(TARGET_ARCH_ABI) webcore_$(TARGET_ARCH_ABI)
LOCAL_EXPORT_CFLAGS 	:= -I$(LOCAL_PATH)/$(VAULT_PATH)/include/webkitgtk-4.0
LOCAL_EXPORT_LDLIBS     := -L$(LOCAL_PATH)/$(VAULT_PATH)/lib -lwebkit2gtk-4.0

$(LOCAL_MODULE): $(LOCAL_SHARED_LIBRARIES)
	$(shell mkdir -p src/main/java/org/liquidplayer/hemroid)
	$(shell cp -r $(LOCAL_PATH)/../webkitgtk+/java/WebKit2GTK.java src/main/java/org/liquidplayer/hemroid)
$(LOCAL_MODULE)_JavaInterface:
	$(eval EXPORT_JAVA_INTERFACE += new WebKit2GTK(context);)
$(LOCAL_PATH)/$(LOCAL_SRC_FILES):
	$(LOCAL_PATH)/../../hemroid install --abi=$(TARGET_ARCH_ABI) webkitgtk+
libraries: $(LOCAL_PATH)/$(LOCAL_SRC_FILES)

include $(LOCAL_PATH)/../hemroid/prebuilt-shared-library.mk

$(call import-module, gtk+-3)
$(call import-module, libsoup)
$(call import-module, enchant)
$(call import-module, libsecret)
$(call import-module, libwebp)
$(call import-module, hyphen)
$(call import-module, libnotify)
$(call import-module, gst-plugins-base)
