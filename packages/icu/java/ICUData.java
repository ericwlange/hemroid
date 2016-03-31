package org.liquidplayer.hemroid;

public class ICUData extends Hemroid {
    public ICUData(android.content.Context context) {
        super(context);
        loadLibrary("icudata");
    }
}