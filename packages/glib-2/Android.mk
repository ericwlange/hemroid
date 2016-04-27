LOCAL_PATH := $(call my-dir)
VAULT_PATH := ../../vault/hemroot/$(TARGET_ARCH_ABI)

# glib
include $(CLEAR_VARS)

LOCAL_MODULE			:= glib_$(TARGET_ARCH_ABI)
LOCAL_SRC_FILES			:= $(VAULT_PATH)/lib/libglib-2.0.so
LOCAL_SHARED_LIBRARIES	:= libiconv_$(TARGET_ARCH_ABI) libffi_$(TARGET_ARCH_ABI) \
                           libintl_$(TARGET_ARCH_ABI)
LOCAL_LDLIBS			:= -ldl
LOCAL_EXPORT_LDLIBS		:= -L$(LOCAL_PATH)/$(VAULT_PATH)/lib -lglib-2.0

LOCAL_EXPORT_CFLAGS :=				\
	-I$(LOCAL_PATH)/include/glib-2.0	\
	-I$(LOCAL_PATH)/$(VAULT_PATH)/lib/glib-2.0/include	\
	$(NULL)
$(LOCAL_MODULE): $(LOCAL_SHARED_LIBRARIES)
	$(shell mkdir -p src/main/java/org/liquidplayer/hemroid)
	$(shell cp -r $(LOCAL_PATH)/../glib-2/java/Glib.java src/main/java/org/liquidplayer/hemroid)
$(LOCAL_MODULE)_JavaInterface:
	$(eval EXPORT_JAVA_INTERFACE += new Glib(context);)
$(LOCAL_PATH)/$(LOCAL_SRC_FILES):
	$(LOCAL_PATH)/../../hemroid install --abi=$(TARGET_ARCH_ABI) glib-2
libraries: $(LOCAL_PATH)/$(LOCAL_SRC_FILES)

include $(LOCAL_PATH)/../hemroid/prebuilt-shared-library.mk

# gobject
include $(CLEAR_VARS)

LOCAL_MODULE			:= gobject_$(TARGET_ARCH_ABI)
LOCAL_SRC_FILES			:= $(VAULT_PATH)/lib/libgobject-2.0.so
LOCAL_SHARED_LIBRARIES	:= glib_$(TARGET_ARCH_ABI) libffi_$(TARGET_ARCH_ABI)
LOCAL_EXPORT_LDLIBS		:= -L$(LOCAL_PATH)/$(VAULT_PATH)/lib -lgobject-2.0

LOCAL_EXPORT_CFLAGS :=				\
	-I$(LOCAL_PATH)/$(VAULT_PATH)/include/glib-2.0	\
	$(NULL)
$(LOCAL_MODULE): $(LOCAL_SHARED_LIBRARIES)
	$(shell mkdir -p src/main/java/org/liquidplayer/hemroid)
	$(shell cp -r $(LOCAL_PATH)/../glib-2/java/GObject.java src/main/java/org/liquidplayer/hemroid)
$(LOCAL_MODULE)_JavaInterface:
	$(eval EXPORT_JAVA_INTERFACE += new GObject(context);)
$(LOCAL_PATH)/$(LOCAL_SRC_FILES):
	$(LOCAL_PATH)/../../hemroid install --abi=$(TARGET_ARCH_ABI) glib-2
libraries: $(LOCAL_PATH)/$(LOCAL_SRC_FILES)

include $(LOCAL_PATH)/../hemroid/prebuilt-shared-library.mk

# gmodule
include $(CLEAR_VARS)

LOCAL_MODULE			:= gmodule_$(TARGET_ARCH_ABI)
LOCAL_SRC_FILES			:= $(VAULT_PATH)/lib/libgmodule-2.0.so
LOCAL_SHARED_LIBRARIES	:= glib_$(TARGET_ARCH_ABI)
LOCAL_LDLIBS			:= -ldl
LOCAL_EXPORT_LDLIBS		:= -L$(LOCAL_PATH)/$(VAULT_PATH)/lib -lgmodule-2.0

LOCAL_EXPORT_CFLAGS :=				\
	-I$(LOCAL_PATH)/$(VAULT_PATH)/include/glib-2.0	\
	$(NULL)
$(LOCAL_MODULE): $(LOCAL_SHARED_LIBRARIES)
	$(shell mkdir -p src/main/java/org/liquidplayer/hemroid)
	$(shell cp -r $(LOCAL_PATH)/../glib-2/java/GModule.java src/main/java/org/liquidplayer/hemroid)
$(LOCAL_MODULE)_JavaInterface:
	$(eval EXPORT_JAVA_INTERFACE += new GModule(context);)
$(LOCAL_PATH)/$(LOCAL_SRC_FILES):
	$(LOCAL_PATH)/../../hemroid install --abi=$(TARGET_ARCH_ABI) glib-2
libraries: $(LOCAL_PATH)/$(LOCAL_SRC_FILES)

include $(LOCAL_PATH)/../hemroid/prebuilt-shared-library.mk

# gthread
include $(CLEAR_VARS)

LOCAL_MODULE			:= gthread_$(TARGET_ARCH_ABI)
LOCAL_SRC_FILES			:= $(VAULT_PATH)/lib/libgthread-2.0.so
LOCAL_SHARED_LIBRARIES	:= glib_$(TARGET_ARCH_ABI)
LOCAL_EXPORT_LDLIBS		:= -L$(LOCAL_PATH)/$(VAULT_PATH)/lib -lgthread-2.0

LOCAL_EXPORT_CFLAGS :=				\
	-I$(LOCAL_PATH)/$(VAULT_PATH)/include/glib-2.0	\
	$(NULL)
$(LOCAL_MODULE): $(LOCAL_SHARED_LIBRARIES)
	$(shell mkdir -p src/main/java/org/liquidplayer/hemroid)
	$(shell cp -r $(LOCAL_PATH)/../glib-2/java/GThread.java src/main/java/org/liquidplayer/hemroid)
$(LOCAL_MODULE)_JavaInterface:
	$(eval EXPORT_JAVA_INTERFACE += new GThread(context);)
$(LOCAL_PATH)/$(LOCAL_SRC_FILES):
	$(LOCAL_PATH)/../../hemroid install --abi=$(TARGET_ARCH_ABI) glib-2
libraries: $(LOCAL_PATH)/$(LOCAL_SRC_FILES)

include $(LOCAL_PATH)/../hemroid/prebuilt-shared-library.mk

# gio
include $(CLEAR_VARS)

LOCAL_MODULE			:= gio_$(TARGET_ARCH_ABI)
LOCAL_SRC_FILES			:= $(VAULT_PATH)/lib/libgio-2.0.so
LOCAL_SHARED_LIBRARIES	:= glib_$(TARGET_ARCH_ABI) gobject_$(TARGET_ARCH_ABI) gmodule_$(TARGET_ARCH_ABI)
LOCAL_EXPORT_CFLAGS		:= -I$(LOCAL_PATH)/$(VAULT_PATH)/include/glib-2.0
LOCAL_EXPORT_LDLIBS		:= -L$(LOCAL_PATH)/$(VAULT_PATH)/lib -lgio-2.0
$(LOCAL_MODULE): $(LOCAL_SHARED_LIBRARIES)
	$(shell mkdir -p src/main/java/org/liquidplayer/hemroid)
	$(shell cp -r $(LOCAL_PATH)/../glib-2/java/GIO.java src/main/java/org/liquidplayer/hemroid)
$(LOCAL_MODULE)_JavaInterface:
	$(eval EXPORT_JAVA_INTERFACE += new GIO(context);)
$(LOCAL_PATH)/$(LOCAL_SRC_FILES):
	$(LOCAL_PATH)/../../hemroid install --abi=$(TARGET_ARCH_ABI) glib-2
libraries: $(LOCAL_PATH)/$(LOCAL_SRC_FILES)

include $(LOCAL_PATH)/../hemroid/prebuilt-shared-library.mk

$(call import-module, iconv)
$(call import-module, gettext)
$(call import-module, ffi)