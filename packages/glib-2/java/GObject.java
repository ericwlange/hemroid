package org.liquidplayer.hemroid;

public class GObject extends Hemroid {
    public GObject(android.content.Context context) {
        super(context);
        new Glib(context);
        new FFI(context);
        loadLibrary("gobject-2.0");
    }
}