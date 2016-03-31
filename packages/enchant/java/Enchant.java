package org.liquidplayer.hemroid;

public class Enchant extends Hemroid {
    public Enchant(android.content.Context context) {
        super(context);
        new Glib(context);
        new FFI(context);
        loadLibrary("enchant");
    }
}