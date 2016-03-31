package org.liquidplayer.hemroid;

public class GstBase extends Hemroid {
    public GstBase(android.content.Context context) {
        super(context);
        new GStreamer(context);
        new GObject(context);
        new GModule(context);
        new Glib(context);
        loadLibrary("gstbase-1.0");
    }
}