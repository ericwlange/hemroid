LOCAL_PATH := $(call my-dir)
VAULT_PATH := ../../vault/hemroot/$(TARGET_ARCH_ABI)

# A dummy module just to be able to include the icons
include $(CLEAR_VARS)

LOCAL_MODULE        	:= hicolor-icon-theme
LOCAL_SRC_FILES     	:=

$(LOCAL_MODULE): $(VAULT_PATH)/share/icons/hicolor
	$(shell mkdir -p assets/hicolor-icon-theme/icons/hicolor)
	$(shell cp -r $(LOCAL_PATH)/$(VAULT_PATH)/share/icons/hicolor/* assets/hicolor-icon-theme/icons/hicolor)
	$(shell mkdir -p src/main/java/org/liquidplayer/hemroid)
	$(shell cp -r $(LOCAL_PATH)/../hicolor-icon-theme/java/HicolorIconTheme.java src/main/java/org/liquidplayer/hemroid)
$(LOCAL_MODULE)_JavaInterface:
	$(eval EXPORT_JAVA_INTERFACE += new HicolorIconTheme(context);)
$(VAULT_PATH)/share/icons/hicolor:
	$(LOCAL_PATH)/../../hemroid install --abi=$(TARGET_ARCH_ABI) hicolor-icon-theme
libraries: $(LOCAL_PATH)/$(VAULT_PATH)/share/icons/hicolor

include $(BUILD_STATIC_LIBRARY)
