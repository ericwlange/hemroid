# hemroid
Because building Linux libraries for Android is a pain in the ass.

The goal of the `hemroid` project is to simplify the life of an Android developer
making use of the NDK.  Managing APIs x ABIs x version combos, not to mention
configuration flags and the little nits of functionality that are standard in Linux
but not available under some versions of Android, as well as the weirdness
that occurs when cross compiling is daunting.  `hemroid` is designed to simplify
all of that.

The vision is to create a tool that works similarly to Homebrew on OSX or `apt` on
Linux.

Usage
-----
```
hemroid - package manager for android

Usage:
    hemroid <command> <options> <pkgs>
Where:
    <command> is one of:
      install
      remove
      pkginfo
      dependencies

hemroid install [--abi=<abi>] [--api=<api>] [--dirty] [--quiet] [--verbose] <pkgs>
    Installs space-delimted packages, recursively installing dependencies.
        --abi=<abi> install for ABI <abi> only (default: all ABIs)
        --api=<api> override API level (default: max(package min,NDK min))
        --dirty     Do not clean up sandbox when done (debug only)
        --verbose   Echo make output to stdout
        --quiet     Suppress info messages
        
hemroid remove [--abi=<abi>] [--clean] [--quiet] <pkgs>
    Removes space-delimted packages.  This does not recurse dependencies.
        --abi=<abi> remove for ABI <abi> only (default: all ABIs)
        --clean     Delete saved repo, will force fresh rebuild on next install
        --quiet     Suppress info messages

hemroid pkginfo [--abi=<abi>] [--api=<api>] [--quiet] <pkgs>
    Displays package information for space-delimted packages.  The output is in JSON
    format and is not particularly readable for humans.  Future versions will be formatted
    in English.
        --abi=<abi> Information for ABI <abi> only (default: all ABIs)
        --api=<api> override API level (default: max(package min,NDK min))
        --quiet     Suppress info messages

hemroid dependencies [--abi=<abi>] [--api=<api>] [--quiet] <pkgs>
    Displays dependency information for space-delimted packages.  The output is in JSON
    format and is not particularly readable for humans.  Future versions will be formatted
    in English.
        --abi=<abi> Dependencies for ABI <abi> only (default: all ABIs)
        --api=<api> override API level (default: max(package min,NDK min))
        --quiet     Suppress info messages


<pkgs> is one or more of:
atk cairo enchant expat ffi fontconfig freetype2 gdk-pixbuf gettext glib-2 glib-
networking gmp gnutls gst-plugins-base gstreamer gtk+-3 harfbuzz hemroid
hicolor-icon-theme hyphen iconv icu javascriptcore libepoxy libjpeg-turbo
libnotify libpng libsecret libsoup libtasn1 libwebp libxml2 libxslt nettle
openssl pango pixman sqlite3 webkitgtk+

<abi> is one or more of:
armeabi armeabi-v7a arm64-v8a x86 x86_64 mips mips64

Supported <api> depends on ABI, what the package supports, and the NDK.
Minimum <api> for each ABI:
    x86_64      21
    x86         9
    armeabi-v7a 3
    armeabi     3
    mips64      21
    arm64-v8a   21
    mips        9
Unless you know exactly what you're doing, you shouldn't set <api>.  Use 
the default.
```

Using `hemroid` Libraries in Your Project
-----------------------------------------
Each package contains an `Android.mk` file that does the dirty work.  In your
project's JNI directory, create your own `Android.mk`.  Here is an example
from the AndroidJSCore project:

```
LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE    := android-js-core
LOCAL_SRC_FILES := DispatchQueue.cpp \
                   JSContext.cpp \
                   JSObject.cpp \
                   JSString.cpp \
                   JSValue.cpp \
                   threadqueue.c

HEMROID_MODULES        := javascriptcore_$(TARGET_ARCH_ABI) icustub_$(TARGET_ARCH_ABI)
LOCAL_SHARED_LIBRARIES := $(HEMROID_MODULES)

LOCAL_CPPFLAGS  := -std=c++11
LOCAL_LDFLAGS := -llog

include $(BUILD_SHARED_LIBRARY)

$(call import-module, hemroid)
$(call import-module, javascriptcore)
$(call import-module, icu/icustub)
```

This example includes the `javascriptcore` package and `icu` with the `icudata` stubbed out.  It
looks like your standard NDK makefile.  To work propertly, you need to set the `HEMROID_MODULES` target.
Simply include the package names that you want with `_$(TARGET_ARCH_ABI)` appended.  Then make
sure that `$(HEMROID_MODULES)` is included in `LOCAL_SHARED_LIBRARIES`.

You will also need to import the `hemroid` module and the modules from the packages you've chosen.

Now when you run `ndk-build`, your code will be compiled against the requested libraries (and their
dependencies).

Note, three environment variables need to be set:

    ANDROID_SDK          -  Path to the Android SDK
    ANDROID_NDK          -  Path to the Android NDK
    NDK_MODULE_PATH      -  Path to /hemroid/packages
    
Once `ndk-build` is complete, some Java code will be created in the `src/main/java/org/liquidplayer/hemroid/`
directory.  This code must be called before the libraries are used.  For simplicity, a `HemroidApplication`
class is created, and you can simply override the `Application` class and this will all be handled for you.
In your `AndroidManifest.xml`, add the property `android:name="org.liquidplayer.hemroid.HemroidApplication"`
to the `<application />` tag.  That is all that is required to handle initialization.

Notes
-----
* Some projects can take an insanely long time to build.  `webkitgtk+` for instance, takes at least 90 minutes for _each ABI_.  But once it is built properly, a repository is created and installation happens quickly.
* Some builds may fail due to missing host-side requirements.  Look at `/tmp/hemroid.burst` to examine failures.  You may need to install some tools on your host.
* If a build fails, even a long one, there is no way to restart it from where you left off.  I have lost weeks of my life to WebKit because of this.  Future versions may support this better.
* `hemroid` works on both Mac OSX (El Capitan is verified) and Linux (Ubuntu 14.4 LTS), though there are sometimes quirks in each.  As of this writing, for instance, `harfbuzz` will fail to build the first time on Linux only, but if you re-run it it will complete the second time.  I don't know why (well that's not true -- I can see the bug, but I am not sure what is causing it).
* `hemroid` is a work in progress.  Don't use it unless you are a hacker and ready to roll up your sleeves to figure out what's going on.  Please contribute to this project.  It will only get better with help from the community.
