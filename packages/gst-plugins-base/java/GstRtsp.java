package org.liquidplayer.hemroid;

public class GstRtsp extends Hemroid {
    public GstRtsp(android.content.Context context) {
        super(context);
        new GStreamer(context);
        new GIO(context);
        new GObject(context);
        new Glib(context);
        loadLibrary("gstrtsp-1.0");
    }
}