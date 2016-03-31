package org.liquidplayer.hemroid;

public class GDKPixbuf extends Hemroid {
    public GDKPixbuf(android.content.Context context) {
        super(context);
        new GIO(context);
        new GModule(context);
        new GObject(context);
        new FFI(context);
        new Glib(context);
        new JPEG(context);
        new PNG(context);
        loadLibrary("gdk_pixbuf-2.0");
    }
}