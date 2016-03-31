package org.liquidplayer.hemroid;

public class PNG extends Hemroid {
    public PNG(android.content.Context context) {
        super(context);
        loadLibrary("png16");
    }
}