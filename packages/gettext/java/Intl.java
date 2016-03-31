package org.liquidplayer.hemroid;

public class Intl extends Hemroid {
    public Intl(android.content.Context context) {
        super(context);
        new IConv(context);
        loadLibrary("intl");
    }
}