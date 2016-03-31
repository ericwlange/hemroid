package org.liquidplayer.hemroid;

public class GstApp extends Hemroid {
    public GstApp(android.content.Context context) {
        super(context);
        new GstBase(context);
        new GStreamer(context);
        new GObject(context);
        new Glib(context);
        loadLibrary("gstapp-1.0");
    }
}