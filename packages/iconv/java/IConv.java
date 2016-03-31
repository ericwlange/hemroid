package org.liquidplayer.hemroid;

public class IConv extends Hemroid {
    public IConv(android.content.Context context) {
        super(context);
        loadLibrary("iconv");
    }
}