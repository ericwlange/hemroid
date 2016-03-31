package org.liquidplayer.hemroid;

public class GIO extends Hemroid {
    public GIO(android.content.Context context) {
        super(context);
        new GObject(context);
        new GModule(context);
        new Glib(context);
        loadLibrary("gio-2.0");
    }
}