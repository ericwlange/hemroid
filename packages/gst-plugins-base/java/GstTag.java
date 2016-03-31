package org.liquidplayer.hemroid;

public class GstTag extends Hemroid {
    public GstTag(android.content.Context context) {
        super(context);
        new GstBase(context);
        new GStreamer(context);
        new GObject(context);
        new Glib(context);
        loadLibrary("gsttag-1.0");
    }
}