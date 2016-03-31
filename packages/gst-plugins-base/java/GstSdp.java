package org.liquidplayer.hemroid;

public class GstSdp extends Hemroid {
    public GstSdp(android.content.Context context) {
        super(context);
        new GStreamer(context);
        new GIO(context);
        new GObject(context);
        new Glib(context);
        loadLibrary("gstsdp-1.0");
    }
}