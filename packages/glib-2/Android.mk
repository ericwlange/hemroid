LOCAL_PATH := $(call my-dir)

# glib
include $(CLEAR_VARS)

LOCAL_MODULE			:= glib
LOCAL_SRC_FILES			:= ../../$(TARGET_ARCH_ABI)/lib/libglib-2.0.so
LOCAL_LDLIBS			:= -ldl
LOCAL_EXPORT_LDLIBS		:= -L$(LOCAL_PATH)/../../$(TARGET_ARCH_ABI)/lib -lglib-2.0

LOCAL_EXPORT_CFLAGS :=				\
	-I$(LOCAL_PATH)/include/glib-2.0	\
	-I$(LOCAL_PATH)/../../$(TARGET_ARCH_ABI)/lib/glib-2.0/include	\
	$(NULL)
$(LOCAL_MODULE): $(LOCAL_SHARED_LIBRARIES)
	$(shell mkdir -p src/main/java/org/liquidplayer/hemroid)
	$(shell cp -r $(LOCAL_PATH)/../../java/Glib.java src/main/java/org/liquidplayer/hemroid)
$(LOCAL_MODULE)_JavaInterface:
	$(eval EXPORT_JAVA_INTERFACE += new Glib(context);)

include $(PREBUILT_SHARED_LIBRARY)

# gobject
include $(CLEAR_VARS)

LOCAL_MODULE			:= gobject
LOCAL_SRC_FILES			:= ../../$(TARGET_ARCH_ABI)/lib/libgobject-2.0.so
LOCAL_SHARED_LIBRARIES	:= glib libffi
LOCAL_EXPORT_LDLIBS		:= -L$(LOCAL_PATH)/../../$(TARGET_ARCH_ABI)/lib -lgobject-2.0

LOCAL_EXPORT_CFLAGS :=				\
	-I$(LOCAL_PATH)/../../$(TARGET_ARCH_ABI)/include/glib-2.0	\
	$(NULL)
$(LOCAL_MODULE): $(LOCAL_SHARED_LIBRARIES)
	$(shell mkdir -p src/main/java/org/liquidplayer/hemroid)
	$(shell cp -r $(LOCAL_PATH)/../../java/GObject.java src/main/java/org/liquidplayer/hemroid)
$(LOCAL_MODULE)_JavaInterface:
	$(eval EXPORT_JAVA_INTERFACE += new GObject(context);)

include $(PREBUILT_SHARED_LIBRARY)

# gmodule
include $(CLEAR_VARS)

LOCAL_MODULE			:= gmodule
LOCAL_SRC_FILES			:= ../../$(TARGET_ARCH_ABI)/lib/libgmodule-2.0.so
LOCAL_SHARED_LIBRARIES	:= glib
LOCAL_LDLIBS			:= -ldl
LOCAL_EXPORT_LDLIBS		:= -L$(LOCAL_PATH)/../../$(TARGET_ARCH_ABI)/lib -lgmodule-2.0

LOCAL_EXPORT_CFLAGS :=				\
	-I$(LOCAL_PATH)/../../$(TARGET_ARCH_ABI)/include/glib-2.0	\
	$(NULL)
$(LOCAL_MODULE): $(LOCAL_SHARED_LIBRARIES)
	$(shell mkdir -p src/main/java/org/liquidplayer/hemroid)
	$(shell cp -r $(LOCAL_PATH)/../../java/GModule.java src/main/java/org/liquidplayer/hemroid)
$(LOCAL_MODULE)_JavaInterface:
	$(eval EXPORT_JAVA_INTERFACE += new GModule(context);)

include $(PREBUILT_SHARED_LIBRARY)

# gthread
include $(CLEAR_VARS)

LOCAL_MODULE			:= gthread
LOCAL_SRC_FILES			:= ../../$(TARGET_ARCH_ABI)/lib/libgthread-2.0.so
LOCAL_SHARED_LIBRARIES	:= glib
LOCAL_EXPORT_LDLIBS		:= -L$(LOCAL_PATH)/../../$(TARGET_ARCH_ABI)/lib -lgthread-2.0

LOCAL_EXPORT_CFLAGS :=				\
	-I$(LOCAL_PATH)/../../$(TARGET_ARCH_ABI)/include/glib-2.0	\
	$(NULL)
$(LOCAL_MODULE): $(LOCAL_SHARED_LIBRARIES)
	$(shell mkdir -p src/main/java/org/liquidplayer/hemroid)
	$(shell cp -r $(LOCAL_PATH)/../../java/GThread.java src/main/java/org/liquidplayer/hemroid)
$(LOCAL_MODULE)_JavaInterface:
	$(eval EXPORT_JAVA_INTERFACE += new GThread(context);)

include $(PREBUILT_SHARED_LIBRARY)

# gio
include $(CLEAR_VARS)

LOCAL_MODULE			:= gio
LOCAL_SRC_FILES			:= ../../$(TARGET_ARCH_ABI)/lib/libgio-2.0.so
LOCAL_SHARED_LIBRARIES	:= glib gobject gmodule
LOCAL_EXPORT_CFLAGS		:= -I$(LOCAL_PATH)/../../$(TARGET_ARCH_ABI)/include/glib-2.0
LOCAL_EXPORT_LDLIBS		:= -L$(LOCAL_PATH)/../../$(TARGET_ARCH_ABI)/lib -lgio-2.0
$(LOCAL_MODULE): $(LOCAL_SHARED_LIBRARIES)
	$(shell mkdir -p src/main/java/org/liquidplayer/hemroid)
	$(shell cp -r $(LOCAL_PATH)/../../java/GIO.java src/main/java/org/liquidplayer/hemroid)
$(LOCAL_MODULE)_JavaInterface:
	$(eval EXPORT_JAVA_INTERFACE += new GIO(context);)

include $(PREBUILT_SHARED_LIBRARY)

$(call import-module, iconv)
$(call import-module, gettext)
$(call import-module, ffi)