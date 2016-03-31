package org.liquidplayer.hemroid;

public class JavaScriptCoreGTK extends Hemroid {
    public JavaScriptCoreGTK(android.content.Context context) {
        super(context);
        loadLibrary("gnustl_shared");
        new ICUI18n(context);
        new Glib(context);
        new ICUUC(context);
        new GIO(context);
        new GObject(context);
        loadLibrary("javascriptcoregtk-4.0");
    }
}