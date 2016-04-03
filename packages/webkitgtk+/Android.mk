LOCAL_PATH := $(call my-dir)
VAULT_PATH := ../../vault/hemroot/$(TARGET_ARCH_ABI)

# javascriptcore
include $(CLEAR_VARS)

LOCAL_MODULE        	:= javascriptcore
LOCAL_SRC_FILES     	:= $(VAULT_PATH)/lib/libjavascriptcoregtk-4.0.so
LOCAL_SHARED_LIBRARIES 	:= icui18n glib icuuc gnustl_shared gio gobject
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

LOCAL_MODULE        	:= webcore
LOCAL_SRC_FILES     	:= $(VAULT_PATH)/lib/libWebCoreGTK.so
LOCAL_SHARED_LIBRARIES  := gtk gdk pangocairo pango atk cairo-gobject cairo \
                           gdk-pixbuf glib gio gobject libnotify gthread pangoft2 \
                           libepoxy icudata icui18n icuuc enchant fontconfig freetype \
                           gmodule harfbuzz harfbuzz-icu libjpeg libsecret libsoup libxml2 \
                           hyphen libpng sqlite3 libwebp gstapp gstbase gstreamer \
                           gstpbutils gstaudio gsttag gstvideo gstfft
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

LOCAL_MODULE        	:= webkit2
LOCAL_SRC_FILES     	:= $(VAULT_PATH)/lib/libwebkit2gtk-4.0.so
LOCAL_SHARED_LIBRARIES 	:= javascriptcore webcore
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
