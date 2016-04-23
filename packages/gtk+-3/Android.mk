LOCAL_PATH := $(call my-dir)
VAULT_PATH := ../../vault/hemroot/$(TARGET_ARCH_ABI)

# gdk
include $(CLEAR_VARS)

LOCAL_MODULE        	:= gdk_$(TARGET_ARCH_ABI)
LOCAL_SRC_FILES     	:= $(VAULT_PATH)/lib/libgdk-3.so
LOCAL_SHARED_LIBRARIES 	:= pangocairo_$(TARGET_ARCH_ABI) \
                           pangoft2_$(TARGET_ARCH_ABI) \
                           gthread_$(TARGET_ARCH_ABI) \
                           fontconfig_$(TARGET_ARCH_ABI) \
                           xml2_$(TARGET_ARCH_ABI) \
                           harfbuzz_$(TARGET_ARCH_ABI) \
                           gnustl_shared \
                           freetype_$(TARGET_ARCH_ABI) \
                           libpng_$(TARGET_ARCH_ABI) \
                           cairo_$(TARGET_ARCH_ABI) \
                           pixman_$(TARGET_ARCH_ABI) \
                           pango_$(TARGET_ARCH_ABI) \
                           gobject_$(TARGET_ARCH_ABI) \
                           glib_$(TARGET_ARCH_ABI) \
                           libffi_$(TARGET_ARCH_ABI) \
                           atk_$(TARGET_ARCH_ABI)
LOCAL_LDLIBS 			:= -llog -lz -lm -lstdc++ -lGLESv2 -lEGL
LOCAL_EXPORT_CFLAGS 	:= -I$(LOCAL_PATH)/$(VAULT_PATH)/include/gtk-3.0
LOCAL_EXPORT_LDLIBS     := -L$(LOCAL_PATH)/$(VAULT_PATH)/lib -lgdk-3
$(LOCAL_MODULE): $(LOCAL_SHARED_LIBRARIES)
	$(shell mkdir -p src/main/java/org/liquidplayer/hemroid)
	$(shell cp -r $(LOCAL_PATH)/../gtk+-3/java/GDK.java src/main/java/org/liquidplayer/hemroid)
$(LOCAL_MODULE)_JavaInterface:
	$(eval EXPORT_JAVA_INTERFACE += new GDK(context);)
$(LOCAL_PATH)/$(LOCAL_SRC_FILES):
	$(LOCAL_PATH)/../../hemroid install --abi=$(TARGET_ARCH_ABI) gtk+-3
libraries: $(LOCAL_PATH)/$(LOCAL_SRC_FILES)

include $(LOCAL_PATH)/../hemroid/prebuilt-shared-library.mk

# gtk
include $(CLEAR_VARS)

LOCAL_MODULE        	:= gtk_$(TARGET_ARCH_ABI)
LOCAL_SRC_FILES     	:= $(VAULT_PATH)/lib/libgtk-3.so
LOCAL_SHARED_LIBRARIES 	:= gdk_$(TARGET_ARCH_ABI)
LOCAL_STATIC_LIBRARIES  := hicolor-icon-theme_$(TARGET_ARCH_ABI)
LOCAL_LDLIBS 			:= -llog -lz -lm -lstdc++
LOCAL_EXPORT_CFLAGS 	:= -I$(LOCAL_PATH)/$(VAULT_PATH)/include/gtk-3.0
LOCAL_EXPORT_LDLIBS     := -L$(LOCAL_PATH)/$(VAULT_PATH)/lib -lgtk-3
$(LOCAL_MODULE): $(LOCAL_SHARED_LIBRARIES) $(LOCAL_STATIC_LIBRARIES)
	$(shell mkdir -p src/main/java/org/liquidplayer/hemroid)
	$(shell cp -r $(LOCAL_PATH)/../gtk+-3/java/GTK.java src/main/java/org/liquidplayer/hemroid)
$(LOCAL_MODULE)_JavaInterface:
	$(eval EXPORT_JAVA_INTERFACE += new GTK(context);)
$(LOCAL_PATH)/$(LOCAL_SRC_FILES):
	$(LOCAL_PATH)/../../hemroid install --abi=$(TARGET_ARCH_ABI) gtk+-3
libraries: $(LOCAL_PATH)/$(LOCAL_SRC_FILES)

include $(LOCAL_PATH)/../hemroid/prebuilt-shared-library.mk

$(call import-module, atk)
$(call import-module, gdk-pixbuf)
$(call import-module, libepoxy)
$(call import-module, pango)
$(call import-module, hicolor-icon-theme)
