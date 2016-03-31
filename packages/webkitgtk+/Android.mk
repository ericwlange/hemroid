LOCAL_PATH := $(call my-dir)

# javascriptcore
include $(CLEAR_VARS)

LOCAL_MODULE        	:= javascriptcore
LOCAL_SRC_FILES     	:= ../../$(TARGET_ARCH_ABI)/lib/libjavascriptcoregtk-4.0.so
LOCAL_SHARED_LIBRARIES 	:= icui18n glib icuuc gnustl_shared gio gobject
LOCAL_LDLIBS 			:= -llog -lz -lm -lstdc++
LOCAL_EXPORT_CFLAGS 	:= -I$(LOCAL_PATH)/../../$(TARGET_ARCH_ABI)/include/webkitgtk-4.0
LOCAL_EXPORT_LDLIBS     := -L$(LOCAL_PATH)/../../$(TARGET_ARCH_ABI)/lib -ljavascriptcoregtk-4.0

$(LOCAL_MODULE): $(LOCAL_SHARED_LIBRARIES)
	$(shell mkdir -p src/main/java/org/liquidplayer/hemroid)
	$(shell cp -r $(LOCAL_PATH)/../../java/JavaScriptCoreGTK.java src/main/java/org/liquidplayer/hemroid)
$(LOCAL_MODULE)_JavaInterface:
	$(eval EXPORT_JAVA_INTERFACE += new JavaScriptCoreGTK(context);)

include $(PREBUILT_SHARED_LIBRARY)

# webcore
include $(CLEAR_VARS)

LOCAL_MODULE        	:= webcore
LOCAL_SRC_FILES     	:= ../../$(TARGET_ARCH_ABI)/lib/libWebCoreGTK.so
LOCAL_SHARED_LIBRARIES  := gtk gdk pangocairo pango atk cairo-gobject cairo \
                           gdk-pixbuf glib gio gobject libnotify gthread pangoft2 \
                           libepoxy icudata icui18n icuuc enchant fontconfig freetype \
                           gmodule harfbuzz harfbuzz-icu libjpeg libsecret libsoup libxml2 \
                           hyphen libpng sqlite3 libwebp gstapp gstbase gstreamer \
                           gstpbutils gstaudio gsttag gstvideo gstfft
LOCAL_LDLIBS 			:= -llog -lz -lm -lstdc++
LOCAL_EXPORT_CFLAGS 	:= -I$(LOCAL_PATH)/../../$(TARGET_ARCH_ABI)/include/webkitgtk-4.0
LOCAL_EXPORT_LDLIBS     := -L$(LOCAL_PATH)/../../$(TARGET_ARCH_ABI)/lib -lWebCoreGTK

$(LOCAL_MODULE): $(LOCAL_SHARED_LIBRARIES)
	$(shell mkdir -p src/main/java/org/liquidplayer/hemroid)
	$(shell cp -r $(LOCAL_PATH)/../../java/WebCoreGTK.java src/main/java/org/liquidplayer/hemroid)
$(LOCAL_MODULE)_JavaInterface:
	$(eval EXPORT_JAVA_INTERFACE += new WebCoreGTK(context);)

include $(PREBUILT_SHARED_LIBRARY)

# webkit2
include $(CLEAR_VARS)

LOCAL_MODULE        	:= webkit2
LOCAL_SRC_FILES     	:= ../../$(TARGET_ARCH_ABI)/lib/libwebkit2gtk-4.0.so
LOCAL_SHARED_LIBRARIES 	:= javascriptcore webcore
LOCAL_EXPORT_CFLAGS 	:= -I$(LOCAL_PATH)/../../$(TARGET_ARCH_ABI)/include/webkitgtk-4.0
LOCAL_EXPORT_LDLIBS     := -L$(LOCAL_PATH)/../../$(TARGET_ARCH_ABI)/lib -lwebkit2gtk-4.0

$(LOCAL_MODULE): $(LOCAL_SHARED_LIBRARIES)
	$(shell mkdir -p src/main/java/org/liquidplayer/hemroid)
	$(shell cp -r $(LOCAL_PATH)/../../java/WebKit2GTK.java src/main/java/org/liquidplayer/hemroid)
$(LOCAL_MODULE)_JavaInterface:
	$(eval EXPORT_JAVA_INTERFACE += new WebKit2GTK(context);)

include $(PREBUILT_SHARED_LIBRARY)

$(call import-module, gtk+-3)
$(call import-module, libsoup)
$(call import-module, enchant)
$(call import-module, libsecret)
$(call import-module, libwebp)
$(call import-module, hyphen)
$(call import-module, libnotify)
$(call import-module, gst-plugins-base)
