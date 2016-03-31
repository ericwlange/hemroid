LOCAL_PATH := $(call my-dir)

# A dummy module just to be able to include the icons
include $(CLEAR_VARS)

LOCAL_MODULE        	:= hicolor-icon-theme
LOCAL_SRC_FILES     	:=

$(LOCAL_MODULE):
	$(shell mkdir -p assets/hicolor-icon-theme/icons/hicolor)
	$(shell cp -r $(LOCAL_PATH)/../../$(TARGET_ARCH_ABI)/share/icons/hicolor/* assets/hicolor-icon-theme/icons/hicolor)
	$(shell mkdir -p src/main/java/org/liquidplayer/hemroid)
	$(shell cp -r $(LOCAL_PATH)/../../java/HicolorIconTheme.java src/main/java/org/liquidplayer/hemroid)
$(LOCAL_MODULE)_JavaInterface:
	$(eval EXPORT_JAVA_INTERFACE += new HicolorIconTheme(context);)

include $(BUILD_STATIC_LIBRARY)
