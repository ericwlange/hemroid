package org.liquidplayer.hemroid;

public class Secret extends Hemroid {
    public Secret(android.content.Context context) {
        super(context);
        new GIO(context);
        new GModule(context);
        new GObject(context);
        new FFI(context);
        new Glib(context);
        loadLibrary("secret-1");
    }
}