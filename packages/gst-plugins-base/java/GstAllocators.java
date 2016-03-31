package org.liquidplayer.hemroid;

public class GstAllocators extends Hemroid {
    public GstAllocators(android.content.Context context) {
        super(context);
        new GStreamer(context);
        new GObject(context);
        new Glib(context);
        loadLibrary("gstallocators-1.0");
    }
}