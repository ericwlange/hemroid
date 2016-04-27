package org.liquidplayer.hemroid;

public class ICUUC extends Hemroid {
    public ICUUC(android.content.Context context) {
        super(context);
        new ICUData(context);
        loadLibrary("gnustl_shared");
        loadLibrary("icuhemuc");
    }
}