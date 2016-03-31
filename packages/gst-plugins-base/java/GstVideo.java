package org.liquidplayer.hemroid;

public class GstVideo extends Hemroid {
    public GstVideo(android.content.Context context) {
        super(context);
        new GstBase(context);
        new GStreamer(context);
        new GObject(context);
        new Glib(context);
        loadLibrary("gstvideo-1.0");
    }
}