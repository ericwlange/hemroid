package org.liquidplayer.hemroid;

public class CairoGObject extends Hemroid {
    public CairoGObject(android.content.Context context) {
        super(context);
        new Cairo(context);
        new Pixman(context);
        new FontConfig(context);
        new Freetype(context);
        new PNG(context);
        new GObject(context);
        new Glib(context);
        loadLibrary("cairo-gobject");
    }
}