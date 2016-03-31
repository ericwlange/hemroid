LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE        	:= gdk-pixbuf
LOCAL_SRC_FILES     	:= ../../$(TARGET_ARCH_ABI)/lib/libgdk_pixbuf-2.0.so
LOCAL_SHARED_LIBRARIES 	:= glib gobject libjpeg libpng
LOCAL_EXPORT_CFLAGS 	:= -I$(LOCAL_PATH)/../../$(TARGET_ARCH_ABI)/include/gdk-pixbuf-2.0
LOCAL_EXPORT_LDLIBS     := -L$(LOCAL_PATH)/../../$(TARGET_ARCH_ABI)/lib -lgdk_pixbuf-2.0
$(LOCAL_MODULE): $(LOCAL_SHARED_LIBRARIES)
	$(shell mkdir -p src/main/java/org/liquidplayer/hemroid)
	$(shell cp -r $(LOCAL_PATH)/../../java/GDKPixbuf.java src/main/java/org/liquidplayer/hemroid)
$(LOCAL_MODULE)_JavaInterface:
	$(eval EXPORT_JAVA_INTERFACE += new GDKPixbuf(context);)

include $(PREBUILT_SHARED_LIBRARY)

$(call import-module, glib-2)
$(call import-module, libjpeg-turbo)
$(call import-module, libpng)