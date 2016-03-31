package org.liquidplayer.hemroid;

public class Notify extends Hemroid {
    public Notify(android.content.Context context) {
        super(context);
        new GDKPixbuf(context);
        new JPEG(context);
        new PNG(context);
        new GIO(context);
        new GModule(context);
        new GObject(context);
        new FFI(context);
        new Glib(context);
        loadLibrary("notify");
    }
}