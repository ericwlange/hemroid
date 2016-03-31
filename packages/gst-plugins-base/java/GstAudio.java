package org.liquidplayer.hemroid;

public class GstAudio extends Hemroid {
    public GstAudio(android.content.Context context) {
        super(context);
        new GstTag(context);
        new GstBase(context);
        new GStreamer(context);
        new GObject(context);
        new Glib(context);
        loadLibrary("gstaudio-1.0");
    }
}