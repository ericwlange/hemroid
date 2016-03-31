LOCAL_PATH := $(call my-dir)

# pango
include $(CLEAR_VARS)

LOCAL_MODULE			:= pango
LOCAL_SRC_FILES			:= ../../$(TARGET_ARCH_ABI)/lib/libpango-1.0.so
LOCAL_SHARED_LIBRARIES	:= gthread gobject
LOCAL_EXPORT_CFLAGS		:= -I$(LOCAL_PATH)/../../$(TARGET_ARCH_ABI)/include/pango-1.0
LOCAL_EXPORT_LDLIBS		:= -L$(LOCAL_PATH)/../../$(TARGET_ARCH_ABI)/lib -lpango-1.0
$(LOCAL_MODULE): $(LOCAL_SHARED_LIBRARIES)
	$(shell mkdir -p src/main/java/org/liquidplayer/hemroid)
	$(shell cp -r $(LOCAL_PATH)/../../java/Pango.java src/main/java/org/liquidplayer/hemroid)
$(LOCAL_MODULE)_JavaInterface:
	$(eval EXPORT_JAVA_INTERFACE += new Pango(context);)

include $(PREBUILT_SHARED_LIBRARY)

# pangoft2
include $(CLEAR_VARS)

LOCAL_MODULE			:= pangoft2
LOCAL_SRC_FILES			:= ../../$(TARGET_ARCH_ABI)/lib/libpangoft2-1.0.so
LOCAL_SHARED_LIBRARIES	:= pango freetype harfbuzz fontconfig
LOCAL_EXPORT_CFLAGS		:= -I$(LOCAL_PATH)/../../$(TARGET_ARCH_ABI)/include/pango-1.0
LOCAL_EXPORT_LDLIBS		:= -L$(LOCAL_PATH)/../../$(TARGET_ARCH_ABI)/lib -lpangoft2-1.0
$(LOCAL_MODULE): $(LOCAL_SHARED_LIBRARIES)
	$(shell mkdir -p src/main/java/org/liquidplayer/hemroid)
	$(shell cp -r $(LOCAL_PATH)/../../java/PangoFT2.java src/main/java/org/liquidplayer/hemroid)
$(LOCAL_MODULE)_JavaInterface:
	$(eval EXPORT_JAVA_INTERFACE += new PangoFT2(context);)

include $(PREBUILT_SHARED_LIBRARY)

# pangocairo
include $(CLEAR_VARS)

LOCAL_MODULE			:= pangocairo
LOCAL_SRC_FILES			:= ../../$(TARGET_ARCH_ABI)/lib/libpangocairo-1.0.so
LOCAL_SHARED_LIBRARIES	:= pango pangoft2 cairo
LOCAL_EXPORT_CFLAGS		:= -I$(LOCAL_PATH)/../../$(TARGET_ARCH_ABI)/include/pango-1.0
LOCAL_EXPORT_LDLIBS		:= -L$(LOCAL_PATH)/../../$(TARGET_ARCH_ABI)/lib -lpangocairo-1.0
$(LOCAL_MODULE): $(LOCAL_SHARED_LIBRARIES)
	$(shell mkdir -p src/main/java/org/liquidplayer/hemroid)
	$(shell cp -r $(LOCAL_PATH)/../../java/PangoCairo.java src/main/java/org/liquidplayer/hemroid)
$(LOCAL_MODULE)_JavaInterface:
	$(eval EXPORT_JAVA_INTERFACE += new PangoCairo(context);)

include $(PREBUILT_SHARED_LIBRARY)

$(call import-module, glib-2)
$(call import-module, fontconfig)
$(call import-module, freetype2)
$(call import-module, harfbuzz)
$(call import-module, cairo)