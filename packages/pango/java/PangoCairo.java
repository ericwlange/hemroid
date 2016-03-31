package org.liquidplayer.hemroid;

public class PangoCairo extends Hemroid {
    public PangoCairo(android.content.Context context) {
        super(context);
        loadLibrary("gnustl_shared");
        new Cairo(context);
        new Pixman(context);
        new PangoFT2(context);
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
        loadLibrary("pangocairo-1.0");
    }
}