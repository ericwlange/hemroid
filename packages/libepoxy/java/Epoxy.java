package org.liquidplayer.hemroid;

public class Epoxy extends Hemroid {
    public Epoxy(android.content.Context context) {
        super(context);
        loadLibrary("epoxy");
    }
}