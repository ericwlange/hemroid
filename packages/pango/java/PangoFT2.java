package org.liquidplayer.hemroid;

public class PangoFT2 extends Hemroid {
    public PangoFT2(android.content.Context context) {
        super(context);
        loadLibrary("gnustl_shared");
        new Pango(context);
        new GObject(context);
        new GThread(context);
        new FontConfig(context);
        new XML2(context);
        new Harfbuzz(context);
        new FFI(context);
        new Glib(context);
        new Freetype(context);
        new PNG(context);
        loadLibrary("pangoft2-1.0");
    }
}