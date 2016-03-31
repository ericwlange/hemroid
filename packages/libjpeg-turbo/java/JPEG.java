package org.liquidplayer.hemroid;

public class JPEG extends Hemroid {
    public JPEG(android.content.Context context) {
        super(context);
        loadLibrary("jpeg");
    }
}