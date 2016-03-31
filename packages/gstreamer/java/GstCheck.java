package org.liquidplayer.hemroid;

public class GstCheck extends Hemroid {
    public GstCheck(android.content.Context context) {
        super(context);
        new GStreamer(context);
        new GObject(context);
        new GModule(context);
        new Glib(context);
        loadLibrary("gstcheck-1.0");
    }
}