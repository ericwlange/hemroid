package org.liquidplayer.hemroid;

public class GstRtp extends Hemroid {
    public GstRtp(android.content.Context context) {
        super(context);
        new GstBase(context);
        new GStreamer(context);
        new GObject(context);
        new Glib(context);
        loadLibrary("gstrtp-1.0");
    }
}