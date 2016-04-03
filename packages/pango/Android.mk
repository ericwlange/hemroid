LOCAL_PATH := $(call my-dir)
VAULT_PATH := ../../vault/hemroot/$(TARGET_ARCH_ABI)

# pango
include $(CLEAR_VARS)

LOCAL_MODULE			:= pango
LOCAL_SRC_FILES			:= $(VAULT_PATH)/lib/libpango-1.0.so
LOCAL_SHARED_LIBRARIES	:= gthread gobject
LOCAL_EXPORT_CFLAGS		:= -I$(LOCAL_PATH)/$(VAULT_PATH)/include/pango-1.0
LOCAL_EXPORT_LDLIBS		:= -L$(LOCAL_PATH)/$(VAULT_PATH)/lib -lpango-1.0
$(LOCAL_MODULE): $(LOCAL_SHARED_LIBRARIES)
	$(shell mkdir -p src/main/java/org/liquidplayer/hemroid)
	$(shell cp -r $(LOCAL_PATH)/../pango/java/Pango.java src/main/java/org/liquidplayer/hemroid)
$(LOCAL_MODULE)_JavaInterface:
	$(eval EXPORT_JAVA_INTERFACE += new Pango(context);)
$(LOCAL_PATH)/$(LOCAL_SRC_FILES):
	$(LOCAL_PATH)/../../hemroid install --abi=$(TARGET_ARCH_ABI) pango
libraries: $(LOCAL_PATH)/$(LOCAL_SRC_FILES)

include $(LOCAL_PATH)/../hemroid/prebuilt-shared-library.mk

# pangoft2
include $(CLEAR_VARS)

LOCAL_MODULE			:= pangoft2
LOCAL_SRC_FILES			:= $(VAULT_PATH)/lib/libpangoft2-1.0.so
LOCAL_SHARED_LIBRARIES	:= pango freetype harfbuzz fontconfig
LOCAL_EXPORT_CFLAGS		:= -I$(LOCAL_PATH)/$(VAULT_PATH)/include/pango-1.0
LOCAL_EXPORT_LDLIBS		:= -L$(LOCAL_PATH)/$(VAULT_PATH)/lib -lpangoft2-1.0
$(LOCAL_MODULE): $(LOCAL_SHARED_LIBRARIES)
	$(shell mkdir -p src/main/java/org/liquidplayer/hemroid)
	$(shell cp -r $(LOCAL_PATH)/../pango/java/PangoFT2.java src/main/java/org/liquidplayer/hemroid)
$(LOCAL_MODULE)_JavaInterface:
	$(eval EXPORT_JAVA_INTERFACE += new PangoFT2(context);)
$(LOCAL_PATH)/$(LOCAL_SRC_FILES):
	$(LOCAL_PATH)/../../hemroid install --abi=$(TARGET_ARCH_ABI) pango
libraries: $(LOCAL_PATH)/$(LOCAL_SRC_FILES)

include $(LOCAL_PATH)/../hemroid/prebuilt-shared-library.mk

# pangocairo
include $(CLEAR_VARS)

LOCAL_MODULE			:= pangocairo
LOCAL_SRC_FILES			:= $(VAULT_PATH)/lib/libpangocairo-1.0.so
LOCAL_SHARED_LIBRARIES	:= pango pangoft2 cairo
LOCAL_EXPORT_CFLAGS		:= -I$(LOCAL_PATH)/$(VAULT_PATH)/include/pango-1.0
LOCAL_EXPORT_LDLIBS		:= -L$(LOCAL_PATH)/$(VAULT_PATH)/lib -lpangocairo-1.0
$(LOCAL_MODULE): $(LOCAL_SHARED_LIBRARIES)
	$(shell mkdir -p src/main/java/org/liquidplayer/hemroid)
	$(shell cp -r $(LOCAL_PATH)/../../java/PangoCairo.java src/main/java/org/liquidplayer/hemroid)
$(LOCAL_MODULE)_JavaInterface:
	$(eval EXPORT_JAVA_INTERFACE += new PangoCairo(context);)
$(LOCAL_PATH)/$(LOCAL_SRC_FILES):
	$(LOCAL_PATH)/../../hemroid install --abi=$(TARGET_ARCH_ABI) pango
libraries: $(LOCAL_PATH)/$(LOCAL_SRC_FILES)

include $(LOCAL_PATH)/../hemroid/prebuilt-shared-library.mk

$(call import-module, glib-2)
$(call import-module, fontconfig)
$(call import-module, freetype2)
$(call import-module, harfbuzz)
$(call import-module, cairo)