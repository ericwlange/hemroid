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
// Android<->GDK events conversion & interoperability interface

#ifndef __GDK_ANDROID_EVENTS_H__
#define __GDK_ANDROID_EVENTS_H__

#if !defined (__GDK_H_INSIDE__) && !defined (GDK_COMPILATION)
#error "Only <gdk/gdk.h> can be included directly."
#endif

#include <gdk/gdkversionmacros.h>
#include <android_native_app_glue.h>

G_BEGIN_DECLS

GDK_AVAILABLE_IN_ALL
gboolean gdk_android_process_events_until_display_ready(struct android_app *app);
GDK_AVAILABLE_IN_ALL
void gdk_android_setup_app_callbacks(struct android_app *state, void (*onStop)());

G_END_DECLS

#endif // __GDK_ANDROID_EVENTS_H__