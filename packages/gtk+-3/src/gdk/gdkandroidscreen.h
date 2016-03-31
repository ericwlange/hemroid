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
// ANativeWindow-based GDK screen declaration

#ifndef __GDK_ANDROID_SCREEN_H__
#define __GDK_ANDROID_SCREEN_H__

#if !defined (__GDK_H_INSIDE__) && !defined (GDK_COMPILATION)
#error "Only <gdk/gdk.h> can be included directly."
#endif

#include <gdk/gdkversionmacros.h>
#include <android_native_app_glue.h>

G_BEGIN_DECLS

#define GDK_TYPE_ANDROID_SCREEN              (gdk_android_screen_get_type ())
#define GDK_ANDROID_SCREEN(object)           (G_TYPE_CHECK_INSTANCE_CAST ((object), GDK_TYPE_ANDROID_SCREEN, GdkAndroidScreen))
#define GDK_ANDROID_SCREEN_CLASS(klass)      (G_TYPE_CHECK_CLASS_CAST ((klass), GDK_TYPE_ANDROID_SCREEN, GdkAndroidScreenClass))
#define GDK_IS_ANDROID_SCREEN(object)        (G_TYPE_CHECK_INSTANCE_TYPE ((object), GDK_TYPE_ANDROID_SCREEN))

typedef struct GdkAndroidScreen GdkAndroidScreen;
typedef struct GdkAndroidScreenClass GdkAndroidScreenClass;

GDK_AVAILABLE_IN_ALL
GType gdk_android_screen_get_type(void);

G_END_DECLS

#endif /* __GDK_ANDROID_SCREEN_H__ */