package org.liquidplayer.hemroid;

public class GStreamer extends Hemroid {
    public GStreamer(android.content.Context context) {
        super(context);
        new FFI(context);
        new GObject(context);
        new GModule(context);
        new Glib(context);
        loadLibrary("gstreamer-1.0");
    }
}