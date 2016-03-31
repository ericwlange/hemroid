package org.liquidplayer.hemroid;

public class Nettle extends Hemroid {
    public Nettle(android.content.Context context) {
        super(context);
        loadLibrary("nettle");
    }
}