package org.liquidplayer.hemroid;

public class GDK extends Hemroid {
    public GDK(android.content.Context context) {
        super(context);
        loadLibrary("gnustl_shared");
        new GDKPixbuf(context);
        new JPEG(context);
        new CairoGObject(context);
        new GIO(context);
        new GModule(context);
        new Epoxy(context);
        new PangoCairo(context);
        new PangoFT2(context);
        new Cairo(context);
        new FontConfig(context);
        new XML2(context);
        new Harfbuzz(context);
        new Freetype(context);
        new PNG(context);
        new Pixman(context);
        new Pango(context);
        new GThread(context);
        new GObject(context);
        new Glib(context);
        new FFI(context);
        new HicolorIconTheme(context);
        loadLibrary("gdk-3");
    }
}