package org.liquidplayer.hemroid;

public class GstFft extends Hemroid {
    public GstFft(android.content.Context context) {
        super(context);
        new GStreamer(context);
        new GObject(context);
        new Glib(context);
        loadLibrary("gstfft-1.0");
    }
}