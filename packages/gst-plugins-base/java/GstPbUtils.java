package org.liquidplayer.hemroid;

public class GstPbUtils extends Hemroid {
    public GstPbUtils(android.content.Context context) {
        super(context);
        new GstVideo(context);
        new GstAudio(context);
        new GStreamer(context);
        new GObject(context);
        new Glib(context);
        loadLibrary("gstpbutils-1.0");
    }
}