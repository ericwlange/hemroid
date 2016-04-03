LOCAL_PATH := $(call my-dir)
VAULT_PATH := ../../vault/hemroot/$(TARGET_ARCH_ABI)

include $(CLEAR_VARS)

LOCAL_MODULE        	:= sqlite3
LOCAL_SRC_FILES      	:= $(VAULT_PATH)/lib/libsqlite3.so
LOCAL_EXPORT_CFLAGS 	:= -I$(LOCAL_PATH)/$(VAULT_PATH)/include
LOCAL_EXPORT_LDLIBS     := -L$(LOCAL_PATH)/$(VAULT_PATH)/lib -l$(LOCAL_MODULE)

$(LOCAL_MODULE):
	$(shell mkdir -p src/main/java/org/liquidplayer/hemroid)
	$(shell cp -r $(LOCAL_PATH)/../sqlite3/java/Sqlite3.java src/main/java/org/liquidplayer/hemroid)
$(LOCAL_MODULE)_JavaInterface:
	$(eval EXPORT_JAVA_INTERFACE += new Sqlite3(context);)
$(LOCAL_PATH)/$(LOCAL_SRC_FILES):
	$(LOCAL_PATH)/../../hemroid install --abi=$(TARGET_ARCH_ABI) sqlite3
libraries: $(LOCAL_PATH)/$(LOCAL_SRC_FILES)

include $(LOCAL_PATH)/../hemroid/prebuilt-shared-library.mk
