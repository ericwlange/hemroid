package org.liquidplayer.hemroid;

public class Gmp extends Hemroid {
    public Gmp(android.content.Context context) {
        super(context);
        loadLibrary("gmp");
    }
}