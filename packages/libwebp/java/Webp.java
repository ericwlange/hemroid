package org.liquidplayer.hemroid;

public class Webp extends Hemroid {
    public Webp(android.content.Context context) {
        super(context);
        loadLibrary("webp");
    }
}