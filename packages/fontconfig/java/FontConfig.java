package org.liquidplayer.hemroid;

public class FontConfig extends Hemroid {
    public FontConfig(android.content.Context context) {
        super(context);
        loadLibrary("gnustl_shared");
        new Harfbuzz(context);
        new FFI(context);
        new Glib(context);
        new Freetype(context);
        new PNG(context);
        new XML2(context);
        loadLibrary("fontconfig");
    }
}