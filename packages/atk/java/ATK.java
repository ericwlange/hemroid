package org.liquidplayer.hemroid;

public class ATK extends Hemroid {
    public ATK(android.content.Context context) {
        super(context);
        new GObject(context);
        new Glib(context);
        loadLibrary("atk-1.0");
    }
}