package org.liquidplayer.hemroid;

public class Pango extends Hemroid {
    public Pango(android.content.Context context) {
        super(context);
        new GObject(context);
        new FFI(context);
        new GThread(context);
        new Glib(context);
        loadLibrary("pango-1.0");
    }
}