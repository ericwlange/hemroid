LOCAL_PATH := $(call my-dir)

# gstallocators
include $(CLEAR_VARS)
LOCAL_MODULE			:= gstallocators
LOCAL_SRC_FILES			:= ../../$(TARGET_ARCH_ABI)/lib/libgstallocators-1.0.so
LOCAL_SHARED_LIBRARIES	:= gstreamer libffi
LOCAL_EXPORT_CFLAGS		:= -I$(LOCAL_PATH)/../../$(TARGET_ARCH_ABI)/include/gstreamer-1.0
LOCAL_LDLIBS			:= -lz -lm
LOCAL_EXPORT_LDLIBS		:= -L$(LOCAL_PATH)/../../$(TARGET_ARCH_ABI)/lib -l$(LOCAL_MODULE)-1.0
$(LOCAL_MODULE): $(LOCAL_SHARED_LIBRARIES)
	$(shell mkdir -p src/main/java/org/liquidplayer/hemroid)
	$(shell cp -r $(LOCAL_PATH)/../../java/GstAllocators.java src/main/java/org/liquidplayer/hemroid)
$(LOCAL_MODULE)_JavaInterface:
	$(eval EXPORT_JAVA_INTERFACE += new GstAllocators(context);)
include $(PREBUILT_SHARED_LIBRARY)

# gstapp
include $(CLEAR_VARS)
LOCAL_MODULE			:= gstapp
LOCAL_SRC_FILES			:= ../../$(TARGET_ARCH_ABI)/lib/libgstapp-1.0.so
LOCAL_SHARED_LIBRARIES	:= gstreamer libffi
LOCAL_EXPORT_CFLAGS		:= -I$(LOCAL_PATH)/../../$(TARGET_ARCH_ABI)/include/gstreamer-1.0
LOCAL_LDLIBS			:= -lz -lm
LOCAL_EXPORT_LDLIBS		:= -L$(LOCAL_PATH)/../../$(TARGET_ARCH_ABI)/lib -l$(LOCAL_MODULE)-1.0
$(LOCAL_MODULE): $(LOCAL_SHARED_LIBRARIES)
	$(shell mkdir -p src/main/java/org/liquidplayer/hemroid)
	$(shell cp -r $(LOCAL_PATH)/../../java/GstApp.java src/main/java/org/liquidplayer/hemroid)
$(LOCAL_MODULE)_JavaInterface:
	$(eval EXPORT_JAVA_INTERFACE += new GstApp(context);)
include $(PREBUILT_SHARED_LIBRARY)

# gstaudio
include $(CLEAR_VARS)
LOCAL_MODULE			:= gstaudio
LOCAL_SRC_FILES			:= ../../$(TARGET_ARCH_ABI)/lib/libgstaudio-1.0.so
LOCAL_SHARED_LIBRARIES	:= gstreamer libffi
LOCAL_EXPORT_CFLAGS		:= -I$(LOCAL_PATH)/../../$(TARGET_ARCH_ABI)/include/gstreamer-1.0
LOCAL_LDLIBS			:= -lz -lm
LOCAL_EXPORT_LDLIBS		:= -L$(LOCAL_PATH)/../../$(TARGET_ARCH_ABI)/lib -l$(LOCAL_MODULE)-1.0
$(LOCAL_MODULE): $(LOCAL_SHARED_LIBRARIES)
	$(shell mkdir -p src/main/java/org/liquidplayer/hemroid)
	$(shell cp -r $(LOCAL_PATH)/../../java/GstAudio.java src/main/java/org/liquidplayer/hemroid)
$(LOCAL_MODULE)_JavaInterface:
	$(eval EXPORT_JAVA_INTERFACE += new GstAudio(context);)
include $(PREBUILT_SHARED_LIBRARY)

# gstfft
include $(CLEAR_VARS)
LOCAL_MODULE			:= gstfft
LOCAL_SRC_FILES			:= ../../$(TARGET_ARCH_ABI)/lib/libgstfft-1.0.so
LOCAL_SHARED_LIBRARIES	:= gstreamer libffi
LOCAL_EXPORT_CFLAGS		:= -I$(LOCAL_PATH)/../../$(TARGET_ARCH_ABI)/include/gstreamer-1.0
LOCAL_LDLIBS			:= -lz -lm
LOCAL_EXPORT_LDLIBS		:= -L$(LOCAL_PATH)/../../$(TARGET_ARCH_ABI)/lib -l$(LOCAL_MODULE)-1.0
$(LOCAL_MODULE): $(LOCAL_SHARED_LIBRARIES)
	$(shell mkdir -p src/main/java/org/liquidplayer/hemroid)
	$(shell cp -r $(LOCAL_PATH)/../../java/GstFft.java src/main/java/org/liquidplayer/hemroid)
$(LOCAL_MODULE)_JavaInterface:
	$(eval EXPORT_JAVA_INTERFACE += new GstFft(context);)
include $(PREBUILT_SHARED_LIBRARY)

# gstpbutils
include $(CLEAR_VARS)
LOCAL_MODULE			:= gstpbutils
LOCAL_SRC_FILES			:= ../../$(TARGET_ARCH_ABI)/lib/libgstpbutils-1.0.so
LOCAL_SHARED_LIBRARIES	:= gstreamer libffi
LOCAL_EXPORT_CFLAGS		:= -I$(LOCAL_PATH)/../../$(TARGET_ARCH_ABI)/include/gstreamer-1.0
LOCAL_LDLIBS			:= -lz -lm
LOCAL_EXPORT_LDLIBS		:= -L$(LOCAL_PATH)/../../$(TARGET_ARCH_ABI)/lib -l$(LOCAL_MODULE)-1.0
$(LOCAL_MODULE): $(LOCAL_SHARED_LIBRARIES)
	$(shell mkdir -p src/main/java/org/liquidplayer/hemroid)
	$(shell cp -r $(LOCAL_PATH)/../../java/GstPbUtils.java src/main/java/org/liquidplayer/hemroid)
$(LOCAL_MODULE)_JavaInterface:
	$(eval EXPORT_JAVA_INTERFACE += new GstPbUtils(context);)
include $(PREBUILT_SHARED_LIBRARY)

# gstriff
include $(CLEAR_VARS)
LOCAL_MODULE			:= gstriff
LOCAL_SRC_FILES			:= ../../$(TARGET_ARCH_ABI)/lib/libgstriff-1.0.so
LOCAL_SHARED_LIBRARIES	:= gstreamer libffi
LOCAL_EXPORT_CFLAGS		:= -I$(LOCAL_PATH)/../../$(TARGET_ARCH_ABI)/include/gstreamer-1.0
LOCAL_LDLIBS			:= -lz -lm
LOCAL_EXPORT_LDLIBS		:= -L$(LOCAL_PATH)/../../$(TARGET_ARCH_ABI)/lib -l$(LOCAL_MODULE)-1.0
$(LOCAL_MODULE): $(LOCAL_SHARED_LIBRARIES)
	$(shell mkdir -p src/main/java/org/liquidplayer/hemroid)
	$(shell cp -r $(LOCAL_PATH)/../../java/GstRiff.java src/main/java/org/liquidplayer/hemroid)
$(LOCAL_MODULE)_JavaInterface:
	$(eval EXPORT_JAVA_INTERFACE += new GstRiff(context);)
include $(PREBUILT_SHARED_LIBRARY)

# gstrtp
include $(CLEAR_VARS)
LOCAL_MODULE			:= gstrtp
LOCAL_SRC_FILES			:= ../../$(TARGET_ARCH_ABI)/lib/libgstrtp-1.0.so
LOCAL_SHARED_LIBRARIES	:= gstreamer libffi
LOCAL_EXPORT_CFLAGS		:= -I$(LOCAL_PATH)/../../$(TARGET_ARCH_ABI)/include/gstreamer-1.0
LOCAL_LDLIBS			:= -lz -lm
LOCAL_EXPORT_LDLIBS		:= -L$(LOCAL_PATH)/../../$(TARGET_ARCH_ABI)/lib -l$(LOCAL_MODULE)-1.0
$(LOCAL_MODULE): $(LOCAL_SHARED_LIBRARIES)
	$(shell mkdir -p src/main/java/org/liquidplayer/hemroid)
	$(shell cp -r $(LOCAL_PATH)/../../java/GstRtp.java src/main/java/org/liquidplayer/hemroid)
$(LOCAL_MODULE)_JavaInterface:
	$(eval EXPORT_JAVA_INTERFACE += new GstRtp(context);)
include $(PREBUILT_SHARED_LIBRARY)

# gstrtsp
include $(CLEAR_VARS)
LOCAL_MODULE			:= gstrtsp
LOCAL_SRC_FILES			:= ../../$(TARGET_ARCH_ABI)/lib/libgstrtsp-1.0.so
LOCAL_SHARED_LIBRARIES	:= gstreamer libffi
LOCAL_EXPORT_CFLAGS		:= -I$(LOCAL_PATH)/../../$(TARGET_ARCH_ABI)/include/gstreamer-1.0
LOCAL_LDLIBS			:= -lz -lm
LOCAL_EXPORT_LDLIBS		:= -L$(LOCAL_PATH)/../../$(TARGET_ARCH_ABI)/lib -l$(LOCAL_MODULE)-1.0
$(LOCAL_MODULE): $(LOCAL_SHARED_LIBRARIES)
	$(shell mkdir -p src/main/java/org/liquidplayer/hemroid)
	$(shell cp -r $(LOCAL_PATH)/../../java/GstRtsp.java src/main/java/org/liquidplayer/hemroid)
$(LOCAL_MODULE)_JavaInterface:
	$(eval EXPORT_JAVA_INTERFACE += new GstRtsp(context);)
include $(PREBUILT_SHARED_LIBRARY)

# gstsdp
include $(CLEAR_VARS)
LOCAL_MODULE			:= gstsdp
LOCAL_SRC_FILES			:= ../../$(TARGET_ARCH_ABI)/lib/libgstsdp-1.0.so
LOCAL_SHARED_LIBRARIES	:= gstreamer libffi
LOCAL_EXPORT_CFLAGS		:= -I$(LOCAL_PATH)/../../$(TARGET_ARCH_ABI)/include/gstreamer-1.0
LOCAL_LDLIBS			:= -lz -lm
LOCAL_EXPORT_LDLIBS		:= -L$(LOCAL_PATH)/../../$(TARGET_ARCH_ABI)/lib -l$(LOCAL_MODULE)-1.0
$(LOCAL_MODULE): $(LOCAL_SHARED_LIBRARIES)
	$(shell mkdir -p src/main/java/org/liquidplayer/hemroid)
	$(shell cp -r $(LOCAL_PATH)/../../java/GstSdp.java src/main/java/org/liquidplayer/hemroid)
$(LOCAL_MODULE)_JavaInterface:
	$(eval EXPORT_JAVA_INTERFACE += new GstSdp(context);)
include $(PREBUILT_SHARED_LIBRARY)

# gsttag
include $(CLEAR_VARS)
LOCAL_MODULE			:= gsttag
LOCAL_SRC_FILES			:= ../../$(TARGET_ARCH_ABI)/lib/libgsttag-1.0.so
LOCAL_SHARED_LIBRARIES	:= gstreamer libffi
LOCAL_EXPORT_CFLAGS		:= -I$(LOCAL_PATH)/../../$(TARGET_ARCH_ABI)/include/gstreamer-1.0
LOCAL_LDLIBS			:= -lz -lm
LOCAL_EXPORT_LDLIBS		:= -L$(LOCAL_PATH)/../../$(TARGET_ARCH_ABI)/lib -l$(LOCAL_MODULE)-1.0
$(LOCAL_MODULE): $(LOCAL_SHARED_LIBRARIES)
	$(shell mkdir -p src/main/java/org/liquidplayer/hemroid)
	$(shell cp -r $(LOCAL_PATH)/../../java/GstTag.java src/main/java/org/liquidplayer/hemroid)
$(LOCAL_MODULE)_JavaInterface:
	$(eval EXPORT_JAVA_INTERFACE += new GstTag(context);)
include $(PREBUILT_SHARED_LIBRARY)

# gstvideo
include $(CLEAR_VARS)
LOCAL_MODULE			:= gstvideo
LOCAL_SRC_FILES			:= ../../$(TARGET_ARCH_ABI)/lib/libgstvideo-1.0.so
LOCAL_SHARED_LIBRARIES	:= gstreamer libffi
LOCAL_EXPORT_CFLAGS		:= -I$(LOCAL_PATH)/../../$(TARGET_ARCH_ABI)/include/gstreamer-1.0
LOCAL_LDLIBS			:= -lz -lm
LOCAL_EXPORT_LDLIBS		:= -L$(LOCAL_PATH)/../../$(TARGET_ARCH_ABI)/lib -l$(LOCAL_MODULE)-1.0
$(LOCAL_MODULE): $(LOCAL_SHARED_LIBRARIES)
	$(shell mkdir -p src/main/java/org/liquidplayer/hemroid)
	$(shell cp -r $(LOCAL_PATH)/../../java/GstVideo.java src/main/java/org/liquidplayer/hemroid)
$(LOCAL_MODULE)_JavaInterface:
	$(eval EXPORT_JAVA_INTERFACE += new GstVideo(context);)
include $(PREBUILT_SHARED_LIBRARY)

$(call import-module, gstreamer)