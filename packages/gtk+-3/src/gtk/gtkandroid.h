// Copyright 2014 The GTK+Android Developers. See the COPYRIGHT
// file at the top-level directory of this distribution and at
// http://p2lang.org/COPYRIGHT.
//
// Licensed under the Apache License, Version 2.0 <LICENSE-APACHE or
// http://www.apache.org/licenses/LICENSE-2.0> or the MIT license
// <LICENSE-MIT or http://opensource.org/licenses/MIT>, at your
// option. This file may not be copied, modified, or distributed
// except according to those terms.
//
// Author(s): Evgeny Sologubov
//
// Core android initialization functions

#ifndef __GTK_ANDROID_H__
#define __GTK_ANDROID_H__

#if !defined (__GTK_H_INSIDE__) && !defined (GTK_COMPILATION)
#error "Only <gtk/gtk.h> can be included directly."
#endif

#include <gtk/gtkentry.h>

#include <android_native_app_glue.h>

// Prepares basic infrastructure needed by gtk+ applications.
// Call this function at the beginning of your android_main
// instead of *gtk_init* which would be used on other platforms
GDK_AVAILABLE_IN_ALL
void gtk_android_init(struct android_app *state);

// Finished the activity and makes sure it is properly unloaded
GDK_AVAILABLE_IN_ALL
void gtk_android_exit(struct android_app *state);

#endif // __GTK_ANDROID_H__