package org.liquidplayer.hemroid;

public class Harfbuzz extends Hemroid {
    public Harfbuzz(android.content.Context context) {
        super(context);
        loadLibrary("gnustl_shared");
        new FFI(context);
        new Glib(context);
        loadLibrary("harfbuzz");
    }
}