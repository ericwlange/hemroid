package org.liquidplayer.hemroid;

public class Pixman extends Hemroid {
    public Pixman(android.content.Context context) {
        super(context);
        loadLibrary("pixman-1");
    }
}