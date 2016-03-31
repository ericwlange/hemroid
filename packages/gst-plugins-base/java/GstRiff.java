package org.liquidplayer.hemroid;

public class GstRiff extends Hemroid {
    public GstRiff(android.content.Context context) {
        super(context);
        new GstAudio(context);
        new GstTag(context);
        new GstBase(context);
        new GStreamer(context);
        new GObject(context);
        new Glib(context);
        loadLibrary("gstriff-1.0");
    }
}