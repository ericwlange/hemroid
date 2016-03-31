LOCAL_PATH := $(call my-dir)

# gdk
include $(CLEAR_VARS)

LOCAL_MODULE        	:= gdk
LOCAL_SRC_FILES     	:= ../../$(TARGET_ARCH_ABI)/lib/libgdk-3.so
LOCAL_SHARED_LIBRARIES 	:= pangocairo pangoft2 gthread fontconfig xml2 harfbuzz \
                           gnustl_shared freetype libpng cairo pixman pango gobject \
                           glib libffi atk
LOCAL_LDLIBS 			:= -llog -lz -lm -lstdc++ -lGLESv2 -lEGL
LOCAL_EXPORT_CFLAGS 	:= -I$(LOCAL_PATH)/../../$(TARGET_ARCH_ABI)/include/gtk-3.0
LOCAL_EXPORT_LDLIBS     := -L$(LOCAL_PATH)/../../$(TARGET_ARCH_ABI)/lib -lgdk-3
$(LOCAL_MODULE): $(LOCAL_SHARED_LIBRARIES)
	$(shell mkdir -p src/main/java/org/liquidplayer/hemroid)
	$(shell cp -r $(LOCAL_PATH)/../../java/GDK.java src/main/java/org/liquidplayer/hemroid)
$(LOCAL_MODULE)_JavaInterface:
	$(eval EXPORT_JAVA_INTERFACE += new GDK(context);)
include $(PREBUILT_SHARED_LIBRARY)

# gtk
include $(CLEAR_VARS)

LOCAL_MODULE        	:= gtk
LOCAL_SRC_FILES     	:= ../../$(TARGET_ARCH_ABI)/lib/libgtk-3.so
LOCAL_SHARED_LIBRARIES 	:= gdk
LOCAL_STATIC_LIBRARIES  := hicolor-icon-theme
LOCAL_LDLIBS 			:= -llog -lz -lm -lstdc++
LOCAL_EXPORT_CFLAGS 	:= -I$(LOCAL_PATH)/../../$(TARGET_ARCH_ABI)/include/gtk-3.0
LOCAL_EXPORT_LDLIBS     := -L$(LOCAL_PATH)/../../$(TARGET_ARCH_ABI)/lib -lgtk-3
$(LOCAL_MODULE): $(LOCAL_SHARED_LIBRARIES) $(LOCAL_STATIC_LIBRARIES)
	$(shell mkdir -p src/main/java/org/liquidplayer/hemroid)
	$(shell cp -r $(LOCAL_PATH)/../../java/GTK.java src/main/java/org/liquidplayer/hemroid)
$(LOCAL_MODULE)_JavaInterface:
	$(eval EXPORT_JAVA_INTERFACE += new GTK(context);)
include $(PREBUILT_SHARED_LIBRARY)

$(call import-module, atk)
$(call import-module, gdk-pixbuf)
$(call import-module, libepoxy)
$(call import-module, pango)
$(call import-module, hicolor-icon-theme)
