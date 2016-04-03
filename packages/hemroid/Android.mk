LOCAL_PATH := $(call my-dir)

# A dummy module just to be able to include the icons
include $(CLEAR_VARS)

LOCAL_MODULE        	:= hemroid
LOCAL_SRC_FILES     	:=

$(LOCAL_MODULE):
	$(shell mkdir -p src/main/jniLibs)
	$(shell cp -r libs/* src/main/jniLibs)

all: $(HEMROID_MODULES) $(patsubst %,%_JavaInterface,$(HEMROID_MODULES)) hemroid

include $(BUILD_STATIC_LIBRARY)
