package org.liquidplayer.hemroid;

public class GstNet extends Hemroid {
    public GstNet(android.content.Context context) {
        super(context);
        new GStreamer(context);
        new GModule(context);
        new GIO(context);
        new GObject(context);
        new Glib(context);
        new GstBase(context);
        loadLibrary("gstnet-1.0");
    }
}