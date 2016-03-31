package org.liquidplayer.hemroid;

public class Freetype extends Hemroid {
    public Freetype(android.content.Context context) {
        super(context);
        loadLibrary("gnustl_shared");
        new Harfbuzz(context);
        new FFI(context);
        new Glib(context);
        new PNG(context);
        loadLibrary("freetype");
    }
}