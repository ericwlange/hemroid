package org.liquidplayer.hemroid;

public class ICUI18n extends Hemroid {
    public ICUI18n(android.content.Context context) {
        super(context);
        new ICUUC(context);
        new ICUData(context);
        loadLibrary("gnustl_shared");
        loadLibrary("icui18n");
    }
}