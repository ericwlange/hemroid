package org.liquidplayer.hemroid;

public class Hogweed extends Hemroid {
    public Hogweed(android.content.Context context) {
        super(context);
        new Nettle(context);
        loadLibrary("hogweed");
    }
}