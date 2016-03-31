package org.liquidplayer.hemroid;

public class GModule extends Hemroid {
    public GModule(android.content.Context context) {
        super(context);
        new Glib(context);
        loadLibrary("gmodule-2.0");
    }
}