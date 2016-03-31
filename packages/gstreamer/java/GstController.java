package org.liquidplayer.hemroid;

public class GstController extends Hemroid {
    public GstController(android.content.Context context) {
        super(context);
        new GStreamer(context);
        new GObject(context);
        new GModule(context);
        new Glib(context);
        loadLibrary("gstcontroller-1.0");
    }
}