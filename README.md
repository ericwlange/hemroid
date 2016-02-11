# hemroid
Because building Linux libraries for Android is a pain in the ass.

The goal of the `hemroid` project is to simplify the life of an Android developer
making use of the NDK.  Managing APIs x ABIs x version combos, not to mention
configuration flags and the little nits of functionality that are standard in Linux
but not available under some versions of Android, as well as the weirdness
that occurs when cross compiling is daunting.  `hemroid` is designed to simplify
all of that.

The vision is to create a tool that works similarly to Homebrew on OSX.  Let's
say I want to use GTK+3 on Android.  Some developer somewhere has gotten this
to build (I have!).  Let's share those incantations.

Version 0.1 should support the following commands:

    hemroid update
    hemroid install <pkg> [--abi=<abi>] [--api=<api-level>] \
      [--options=<non-standard config options>] [--force-build]
    hemroid remove <pkg> [--abi=<abi>] [--api=<api-level>]

I have some initial packages built, including but not limited to `glib`, `gtk+-3`,
`webkitgtk`, and about 20 others.  I will build out the initial version to manage
these and will try to find a way to make it easy for other developers to
contribute their library build scripts.

This is a work-in-progress.
