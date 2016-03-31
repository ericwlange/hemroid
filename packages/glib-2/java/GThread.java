package org.liquidplayer.hemroid;

public class GThread extends Hemroid {
    public GThread(android.content.Context context) {
        super(context);
        new Glib(context);
        loadLibrary("gthread-2.0");
    }
}